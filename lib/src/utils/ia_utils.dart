import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

Future<dynamic> loadJsonAsset({required String assetsPath}) async {
  final String jsonString = await rootBundle.loadString(assetsPath);
  return jsonDecode(jsonString);
}

validatorUsername({required String? value}) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (value.length < 6) {
    return 'Username must be at least 6 characters long.';
  }
  return null;
}

extension RandomInt on int {
  static int generate({int min = 0, required int max}) {
    return min + Random().nextInt(max - min);
  }
}