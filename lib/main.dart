import 'package:city_c_ker/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:city_c_ker/data/service_locator.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City C-ker',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
