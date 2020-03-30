import 'package:flutter/foundation.dart';

import 'package:essentials/models/user.dart';

class ServiceConsumer extends User {
  String house;
  String landmark;
  String area;
  String city;
  String state;

  ServiceConsumer({
    @required String name,
    @required String phone,
    @required String email,
    @required String password,
    @required this.house,
    this.landmark,
    @required this.area,
    @required this.city,
    @required this.state,
  }) : super(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
}
