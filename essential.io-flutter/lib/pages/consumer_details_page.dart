import 'package:essentials/widgets/consumer_details_widget.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class ConsumerDetailsPage extends StatelessWidget {
  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
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

    void _done() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Hero(
                    flightShuttleBuilder: _flightShuttleBuilder,
                    tag: 'consumer',
                    child: Text(
                      'consumer',
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontWeight: FontWeight.w300,
                        letterSpacing: 3.0,
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
              ConsumerDetailsWidget(_done),
            ],
          ),
        ),
      ),
    );
  }
}
