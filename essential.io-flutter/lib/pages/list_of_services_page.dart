import 'dart:collection';

import 'package:essentials/models/order_item.dart';
import 'package:essentials/models/service_provider.dart';
import 'package:essentials/util/user_data.dart';
import 'package:essentials/util/utilities.dart';
import 'package:essentials/widgets/custom_alert_dialog.dart';
import 'package:essentials/widgets/order_basket_dialog.dart';
import 'package:essentials/widgets/order_basket_widget.dart';
import 'package:flutter/material.dart';

class ListOfServicesPage extends StatelessWidget {
  final ServiceProvider serviceProvider;

  ListOfServicesPage(this.serviceProvider);

  final HashMap<String, OrderItem> _orderBasket = HashMap();

  String _stringBuilder(int index) =>
      serviceProvider.services[index].quantity.toString() +
      ' ' +
      serviceProvider.services[index].unit +
      '\nmax order limit : ' +
      serviceProvider.services[index].maxOrderLimit.toString();

  Widget _buildListTile(int index) => Container(
        color: Colors.white.withOpacity(0.9),
        margin: const EdgeInsets.symmetric(
          vertical: 2.5,
          horizontal: 5.0,
        ),
        child: ListTile(
          onTap: () {},
          isThreeLine: true,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '₹' + serviceProvider.services[index].price.toString(),
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                  fontSize: 13.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 5.0,
                ),
                padding: const EdgeInsets.all(3.0),
                color: serviceProvider.services[index].outOfStock
                    ? Colors.red[100]
                    : Colors.green[100],
                child: Text(
                  'stock',
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
              serviceProvider.services[index].name,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w300,
                letterSpacing: 2.0,
                fontSize: 15.0,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _stringBuilder(index),
                  style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                    fontSize: 13.0,
                  ),
                ),
                OrderBasketWidget(_orderBasket, serviceProvider, index),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Future<void> _showAlertDialog() async {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(),
      );
    }

    Future<void> _verify() async {
      if (_orderBasket.isEmpty) {
        await _showAlertDialog();
        return;
      }
      List<OrderItem> orderItems = _orderBasket.values.toList();
      double total = 0.0;
      for (OrderItem orderItem in orderItems) total += orderItem.price;
      final result = await showDialog(
        context: context,
        builder: (context) => OrderBasketDialog(
          orderItems,
          total,
        ),
      );
      if (result) {
        UserData.orders.add(_orderBasket);
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: serviceProvider.typeOfService,
            child: Image.asset(
              'assets/images/${serviceProvider.typeOfService}.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Card(
                  color: Colors.white,
                  elevation: 10.0,
                  margin: const EdgeInsets.only(
                    top: 30.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: double.infinity,
                    height: 60.0,
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        serviceProvider.name,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 5.0,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white12,
                elevation: 0.0,
                margin: const EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 2.5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    verticalDirection: VerticalDirection.up,
                    children: List.generate(
                      serviceProvider.services.length,
                      (int index) => _buildListTile(index),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    color: Colors.black45,
                    onPressed: _verify,
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'place your order',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 3.0,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
