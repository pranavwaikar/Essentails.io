import 'dart:collection';

import 'package:essentials/models/order_item.dart';
import 'package:essentials/models/service.dart';
import 'package:essentials/models/service_provider.dart';
import 'package:flutter/material.dart';

class OrderBasketWidget extends StatefulWidget {
  final HashMap<String, OrderItem> orderBasket;
  final ServiceProvider serviceProvider;
  final int index;
  OrderBasketWidget(this.orderBasket, this.serviceProvider, this.index);

  @override
  _OrderBasketWidgetState createState() => _OrderBasketWidgetState();
}

class _OrderBasketWidgetState extends State<OrderBasketWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Service> services = widget.serviceProvider.services;
    final int index = widget.index;

    void incrementQuantity() {
      if (widget.orderBasket.containsKey(services[index].name)) {
        if (widget.orderBasket[services[index].name].quantity <
            services[index].maxOrderLimit)
          widget.orderBasket[services[index].name].quantity++;
        widget.orderBasket[services[index].name].price += services[index].price;
      } else
        widget.orderBasket[services[index].name] = OrderItem(
          typeOfService: widget.serviceProvider.typeOfService,
          name: services[index].name,
          unit: services[index].unit,
          quantity: 1,
          price: services[index].price,
        );
      setState(() {});
    }

    void decrementQuantity() {
      if (widget.orderBasket.containsKey(services[index].name) &&
          widget.orderBasket[services[index].name].quantity > 0) {
        widget.orderBasket[services[index].name].price -= services[index].price;
        if (--widget.orderBasket[services[index].name].quantity == 0)
          widget.orderBasket.remove(services[index].name);
      }
      setState(() {});
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: decrementQuantity,
          child: Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black26,
                size: 20.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            widget.orderBasket.containsKey(
                    widget.serviceProvider.services[widget.index].name)
                ? widget
                    .orderBasket[
                        widget.serviceProvider.services[widget.index].name]
                    .quantity
                    .toString()
                : '0',
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
              fontSize: 15.0,
            ),
          ),
        ),
        InkWell(
          onTap: incrementQuantity,
          child: Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black26,
                size: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
