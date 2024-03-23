import 'package:flutter/material.dart';

import 'package:interview_application/src/src.dart';

class HomeProvider extends ChangeNotifier {
  Status _status = Status.unknown;

  Status get status => _status;

  List<CardItem> _cardItems = [];

  List<CardItem> get cardItems => _cardItems;

  Future<void> getCardItems() async {
    try {
      _status = Status.loading;
      notifyListeners();
      await Future.delayed(
        Duration(seconds: RandomInt.generate(min: 2, max: 5)),
        () async {
          final jsonMap = await loadJsonAsset(assetsPath: "assets/data.json");
          _cardItems =
              (jsonMap as List).map((item) => CardItem.fromJson(item)).toList();
          _status = Status.success;
          notifyListeners();
        },
      );
    } catch (_) {
      _status = Status.failure;
      notifyListeners();
    }
  }

  void sortBy(SortCardItemType? itemType) {
    switch (itemType) {
      case SortCardItemType.like:
        _cardItems.sort((a, b) => a.liked.compareTo(b.liked));
        notifyListeners();
      case SortCardItemType.share:
        _cardItems.sort((a, b) => a.shared.compareTo(b.shared));
        notifyListeners();
      case SortCardItemType.comment:
        _cardItems.sort((a, b) => a.comments.compareTo(b.comments));
        notifyListeners();
      default:
      _cardItems.sort((a, b) => a.date.compareTo(b.date));
      notifyListeners();
    }
  }

}
