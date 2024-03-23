import 'package:flutter/material.dart';
import 'package:interview_application/src/src.dart';
import 'package:interview_application/src/utils/shared_prefs_utils.dart';

class AuthProvider extends ChangeNotifier {
  LoginStatus _status = LoginStatus.unauthenticated;

  LoginStatus get status => _status;

  User? _user;

  User? get user => _user;

  bool get loading => _status == LoginStatus.authenticating;

  bool get alreadyLogin => _status == LoginStatus.authenticated ||
      (SharedPrefsUtils().name != "" && SharedPrefsUtils().avatar != "");

  Future<void> login(String username, String password) async {
    try {
      _status = LoginStatus.authenticating;
      notifyListeners();
      await Future.delayed(
        Duration(seconds: RandomInt.generate(min: 2, max: 5)),
        () async {
          await loginSession(username, password);
        },
      );
    } catch (_) {
      _status = LoginStatus.failure;
      notifyListeners();
    }
  }

  Future logout() async {
    _status = LoginStatus.unauthenticated;
    await SharedPrefsUtils().clear();
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void cache(User? cacheUser) {
    if (cacheUser != null) {
      SharedPrefsUtils().name = cacheUser.name;
      SharedPrefsUtils().avatar = cacheUser.avatarUrl;
    }
  }

  Future<void> loginSession(String username, String password) async {
    final jsonMap = await loadJsonAsset(assetsPath: "assets/auth.json");
    List<User> users =
        (jsonMap as List).map((user) => User.fromJson(user)).toList();
    _user = users.firstWhere(
        (user) => username == user.username && password == user.password);
    if (_user == null) return;
    cache(_user);
    _status = LoginStatus.authenticated;
    notifyListeners();
  }
}
