import 'package:essentials/pages/order_history.dart';
import 'package:essentials/pages/service_provider_list_page.dart';
import 'package:essentials/util/user_data.dart';
import 'package:essentials/util/utilities.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class ConsumerHomePage extends StatelessWidget {
  void pushProviderList(BuildContext context, String typeOfService) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ServiceProviderListPage(typeOfService),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black87,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => pushProviderList(context, Utilities.MEDICINE),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    Hero(
                      tag: Utilities.MEDICINE,
                      child: Image.asset(
                        'assets/images/${Utilities.MEDICINE}.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'medicine',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 5.0,
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => pushProviderList(context, Utilities.HYGIENE),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Hero(
                      tag: Utilities.HYGIENE,
                      child: Image.asset(
                        'assets/images/${Utilities.HYGIENE}.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'hygiene',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 5.0,
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => pushProviderList(context, Utilities.WATER),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Hero(
                      tag: Utilities.WATER,
                      child: Image.asset(
                        'assets/images/${Utilities.WATER}.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'water',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 5.0,
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => pushProviderList(context, Utilities.GROCERIES),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Hero(
                      tag: Utilities.GROCERIES,
                      child: Image.asset(
                        'assets/images/${Utilities.GROCERIES}.jpg',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'groceries',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 5.0,
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => OrderHistory(),
                ),
              ),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'your orders',
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3.0,
                    fontSize: 30.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
