import 'package:interview_application/src/src.dart';
import 'package:interview_application/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {

  late final SharedPreferences _sharedPrefs;

  static final SharedPrefsUtils _instance = SharedPrefsUtils._internal();

  factory SharedPrefsUtils() => _instance;

  SharedPrefsUtils._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get name => _sharedPrefs.getString(keyName) ?? "";

  set name(String value) {
    _sharedPrefs.setString(keyName, value);
  }

  String get avatar => _sharedPrefs.getString(keyAvatar) ?? "";

  set avatar(String value) {
    _sharedPrefs.setString(keyAvatar, value);
  }

  Future clear() async {
    await _sharedPrefs.clear();
  }
}