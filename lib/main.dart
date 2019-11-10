/*
 * Main Dart file for the Philam Hackathon App
 * @author: John Chew [Untitled]
 * @date: November 10, 2019
 * @license: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dartapp/screens/main_screen.dart';
import 'package:dartapp/util/const.dart';

// Set app to be set in portrait only.
void main() async{
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

// Set main state for the app
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // Determines if the app is set to dark theme or not.
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // If Dark theme chosen, choose dark status bar and icon brightness, else just use light version.
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light:Brightness.dark,
    ));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: MainScreen(),
    );
  }
}
