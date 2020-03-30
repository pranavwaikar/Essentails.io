import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[50],
      elevation: 5.0,
      title: Text(
        'an error occured.',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w300,
          letterSpacing: 3.0,
          fontSize: 20.0,
        ),
      ),
      content: Text(
        'basket is empty!',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w300,
          letterSpacing: 3.0,
          fontSize: 15.0,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
          child: RaisedButton(
            elevation: 5.0,
            child: Text(
              'okay',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.blueGrey[50],
                fontWeight: FontWeight.w400,
              ),
            ),
            color: Colors.red[200],
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
