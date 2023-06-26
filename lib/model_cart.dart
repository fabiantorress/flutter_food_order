import 'package:flutter/foundation.dart';

import 'detail_page.dart';

class CartModel extends ChangeNotifier {
  final List<int> itemIds = [];

  void add(int number) {
    itemIds.add(allDetailFood[number].id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(int number) {
    itemIds.remove(allDetailFood[number].id);
    notifyListeners();
  }
}
