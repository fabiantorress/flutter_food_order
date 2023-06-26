import 'package:flutter/foundation.dart';

class SumTotal extends ChangeNotifier {
  final List sumTotal = [];

  void sum() {
    sumTotal.reduce((value, element) => value + element);
    notifyListeners();
  }
}
