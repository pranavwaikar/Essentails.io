import 'package:essentials/pages/consumer_home_page.dart';
import 'package:essentials/pages/provider_home_page.dart';
import 'package:flutter/services.dart';

import 'package:essentials/pages/consumer_details_page.dart';
import 'package:essentials/pages/provider_details_page.dart';
import 'package:essentials/util/user_data.dart';
import 'package:essentials/widgets/user_details_bottom_sheet.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
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

  Future<void> displayModalBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (_) {
        return UserDetailsBottomSheet();
      },
    );
  }

  Future<void> pushDetailsPage(BuildContext context, String userType) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => userType == 'consumer'
            ? ConsumerDetailsPage()
            : ProviderDetailsPage(),
      ),
    );
  }

  void pushHomePage(BuildContext context, String userType) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) =>
            userType == 'consumer' ? ConsumerHomePage() : ProviderHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> getUserDetails(String userType) async {
      if (UserData.user == null) await displayModalBottomSheet(context);

      if (UserData.user != null) {
        await pushDetailsPage(context, userType);

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.black87,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );

        if (UserData.serviceProvider != null ||
            UserData.serviceConsumer != null) pushHomePage(context, userType);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => getUserDetails('provider'),
                child: Container(
                  color: Colors.blueGrey.withOpacity(0.2),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Hero(
                      flightShuttleBuilder: _flightShuttleBuilder,
                      tag: 'service provider',
                      child: Text(
                        'service provider',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 3.0,
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => getUserDetails('consumer'),
                child: Container(
                  color: Colors.black87,
                  alignment: Alignment.topCenter,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
