import 'package:essentials/models/order_item.dart';
import 'package:flutter/material.dart';

class OrderBasketDialog extends StatelessWidget {
  final List<OrderItem> orderBasket;
  final double total;
  OrderBasketDialog(this.orderBasket, this.total);

  String _stringBuilder(int index) =>
      '${index + 1}. ${orderBasket[index].name} : ₹${orderBasket[index].price}';

  Widget buildSummary(int index) => Text(
        _stringBuilder(index),
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.0,
          fontSize: 12.0,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[50],
      elevation: 5.0,
      title: Text(
        'order basket',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w300,
          letterSpacing: 3.0,
          fontSize: 20.0,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...List.generate(
            orderBasket.length,
            (index) => buildSummary(index),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'total : ₹$total',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w300,
              letterSpacing: 3.0,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
          child: RaisedButton(
            elevation: 5.0,
            child: Text(
              'confirm',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.blueGrey[50],
                fontWeight: FontWeight.w400,
              ),
            ),
            color: Colors.red[200],
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
          child: RaisedButton(
            elevation: 5.0,
            child: Text(
              'go back',
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.blueGrey[50],
                fontWeight: FontWeight.w400,
              ),
            ),
            color: Colors.red[200],
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ),
      ],
    );
  }
}
