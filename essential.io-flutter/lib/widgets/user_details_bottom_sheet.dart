import 'package:essentials/models/user.dart';
import 'package:essentials/util/user_data.dart';
import 'package:flutter/material.dart';

class UserDetailsBottomSheet extends StatefulWidget {
  @override
  _UserDetailsBottomSheetState createState() => _UserDetailsBottomSheetState();
}

class _UserDetailsBottomSheetState extends State<UserDetailsBottomSheet> {
  final _userForm = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    void _verify() {
      FocusScope.of(context).requestFocus(FocusNode());
      if (!_userForm.currentState.validate()) return;
      User user = User(
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      UserData.user = user;
      Navigator.of(context).pop();
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _userForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'user details',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              color: Colors.deepPurple[50],
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  hintText: 'hauntarl',
                  hintStyle: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 2.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    size: 30.0,
                    color: Colors.black45,
                  ),
                  labelText: 'name',
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 2.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red[100],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                style: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: 2.0,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.black,
                controller: _nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value.isEmpty)
                    return 'cannot be empty';
                  else if (value.length < 3)
                    return 'cannot be less than 3';
                  else if (value.length > 20)
                    return 'cannot be greater than 20';
                  return null;
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_phoneFocusNode);
                },
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              color: Colors.indigo[50],
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  hintText: '10-digit',
                  hintStyle: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 2.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    size: 30.0,
                    color: Colors.black45,
                  ),
                  labelText: 'phone',
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 2.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red[100],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                style: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: 2.0,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.black,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value.isEmpty)
                    return 'cannot be empty';
                  else if (value.contains(' '))
                    return 'invalid character';
                  else if (value.length != 10) return 'invalid number';
                  return null;
                },
                focusNode: _phoneFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              color: Colors.blue[50],
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  hintText: 'hauntarl97@gmail.com',
                  hintStyle: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 1.5,
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    size: 30.0,
                    color: Colors.black45,
                  ),
                  labelText: 'email',
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 2.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red[100],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                style: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: 1.5,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.black,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value.isEmpty)
                    return 'cannot be empty';
                  else if (value.contains(' '))
                    return 'invalid character';
                  else if (!value.contains('@')) return 'invalid email';
                  return null;
                },
                focusNode: _emailFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              color: Colors.green[50],
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    size: 30.0,
                    color: Colors.black45,
                  ),
                  labelText: 'new password',
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 2.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red[100],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                style: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: 2.0,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.black,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty)
                    return 'cannot be empty';
                  else if (value.contains(' '))
                    return 'invalid character';
                  else if (value.length < 6) return 'password too short';
                  return null;
                },
                focusNode: _passwordFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context)
                      .requestFocus(_confirmPasswordFocusNode);
                },
              ),
            ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
              color: Colors.amber[50],
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  prefixIcon: Icon(
                    Icons.assistant_photo,
                    size: 30.0,
                    color: Colors.black45,
                  ),
                  labelText: 'confirm password',
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 2.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red[100],
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                style: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: 2.0,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty)
                    return 'cannot be empty';
                  else if (value != _passwordController.text)
                    return 'password does not match';
                  return null;
                },
                focusNode: _confirmPasswordFocusNode,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(FocusNode()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                elevation: 5.0,
                onPressed: _verify,
                color: Colors.black87,
                child: Text(
                  'register',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
