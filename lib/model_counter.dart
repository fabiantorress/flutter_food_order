import 'package:flutter/foundation.dart';
import 'package:flutter_food_order/model_cart.dart';

class Counter extends ChangeNotifier {
  Counter(this._cartModel);
  final CartModel _cartModel;
  final Map counts = {};

  void increment(int number) {
    counts[_cartModel.itemIds[number]]++;
    notifyListeners();
  }

  void decrease(int number) {
    counts[_cartModel.itemIds[number]]--;
    notifyListeners();
  }
}
