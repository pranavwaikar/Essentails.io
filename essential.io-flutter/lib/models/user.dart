import 'package:flutter/foundation.dart';

class User {
  String name;
  String email;
  String phone;
  String password;
  User({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.password,
  });
}
