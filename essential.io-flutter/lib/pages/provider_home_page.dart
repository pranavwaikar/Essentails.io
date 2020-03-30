import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class ProviderHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.blueGrey.withOpacity(0.2),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.blueGrey.withOpacity(0.2),
      ),
    );
  }
}
