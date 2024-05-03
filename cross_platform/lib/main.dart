import 'package:cross_platform/login_page.dart';
import 'package:cross_platform/my_app_bar.dart';
import 'package:cross_platform/home_page/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:cross_platform/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
      // MyHomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/MyHomePage': (context) => MyHomePage(),
      },
    );
  }
}
