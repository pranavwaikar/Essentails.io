import 'dart:collection';

import 'package:essentials/models/order_item.dart';
import 'package:essentials/util/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = UserData.orders.reversed.toList();

    Widget buildSummary(OrderItem orderItem) => Text(
          orderItem.name,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
            fontSize: 13.0,
          ),
        );

    Widget _buildOrder(int index) {
      HashMap<String, OrderItem> orderBasket = orders[index];
      final values = orderBasket.values.toList();
      double total = 0.0;
      for (OrderItem orderItem in values) total += orderItem.price;
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.all(5.0),
        color: Colors.blueGrey[50],
        child: ListTile(
          dense: true,
          trailing: Column(
            children: <Widget>[
              Text(
                '₹$total',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                  fontSize: 13.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.only(top: 5.0),
                color: index != 0 ? Colors.green[200] : Colors.red[200],
                child: Text(
                  'status',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              values[0].typeOfService,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                letterSpacing: 3.0,
                fontSize: 20.0,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                values.length,
                (index) => buildSummary(
                  values[index],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'your orders',
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontWeight: FontWeight.w300,
            letterSpacing: 3.0,
            fontSize: 30.0,
            decoration: TextDecoration.none,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 20.0),
        child: orders.length != 0
            ? Column(
                children: List.generate(
                  orders.length,
                  (index) => _buildOrder(index),
                ),
              )
            : Center(
                child: Text(
                  'empty...',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3.0,
                    fontSize: 24.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
      ),
    );
  }
}
