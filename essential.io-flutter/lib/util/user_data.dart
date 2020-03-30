import 'dart:collection';

import 'package:essentials/models/order_item.dart';
import 'package:essentials/models/service_consumer.dart';
import 'package:essentials/models/service_provider.dart';
import 'package:essentials/models/user.dart';
import 'package:essentials/util/utilities.dart';

class UserData {
  static User
      user/*= User(
    name: 'hauntarl',
    phone: '8550947379',
    email: 'hauntarl97@gmail.com',
    password: 'notsameer',
  )*/
      ;
  static ServiceConsumer
      serviceConsumer/*= ServiceConsumer(
    name: user.name,
    phone: user.phone,
    email: user.email,
    password: user.password,
    house: 'A-804 Basant Bahar Society',
    landmark: 'near HDFC Bank',
    area: Utilities.AREAS[0],
    city: Utilities.CITIES[0],
    state: Utilities.STATES[0],
  )*/
      ;
  static List<HashMap<String, OrderItem>> orders = [];
  static ServiceProvider serviceProvider;
}
