import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/get_seatList_model.dart';

class SeatNumberModel extends ChangeNotifier {
  List items = [];
  int sumOfprice = 0;
  int vip = 10000;
  int ordinary = 4000;
  List _seatList = [];

  UnmodifiableListView get seatList => UnmodifiableListView(_seatList);

  set seatlist(List seatList) {
    _seatList = seatList;
    notifyListeners();
  }

  void add(item) {
    items.add(item);
    notifyListeners();
  }

  void remove(item) {
    items.remove(item);
    notifyListeners();
  }

  dynamic get seatNumber {
    return items;
  }

  dynamic addPrice(item) {
    if (item < 22 && item > 0) {
      sumOfprice += vip;
      notifyListeners();
    }
    if (item > 21) {
      sumOfprice += ordinary;
      notifyListeners();
    }
  }

  dynamic reducePrice(item) {
    if (item < 22 && item > 0) {
      sumOfprice -= vip;
      notifyListeners();
    }
    if (item > 21) {
      sumOfprice -= ordinary;
      notifyListeners();
    }
  }

  dynamic get totalPrice {
    return sumOfprice;
  }
}