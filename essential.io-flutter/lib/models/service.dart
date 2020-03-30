import 'package:flutter/foundation.dart';

class Service {
  String name;
  int quantity;
  String unit;
  double price;
  int maxOrderLimit;
  bool outOfStock;

  Service({
    @required this.name,
    @required this.quantity,
    @required this.unit,
    @required this.price,
    @required this.maxOrderLimit,
    this.outOfStock = false,
  });
}
