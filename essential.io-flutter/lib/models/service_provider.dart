import 'package:essentials/models/service.dart';
import 'package:flutter/foundation.dart';

import 'package:essentials/models/user.dart';

class ServiceProvider extends User {
  String state;
  String city;
  String area;
  String typeOfService;
  List<Service> services;

  ServiceProvider({
    @required String name,
    @required String phone,
    @required String email,
    @required String password,
    @required this.state,
    @required this.city,
    @required this.area,
    @required this.typeOfService,
    @required this.services,
  }) : super(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
}
