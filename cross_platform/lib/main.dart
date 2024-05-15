import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart'; // Import the UserProvider
import 'login_page.dart';
import 'home_page/my_home_page.dart';
import 'start_page.dart';
import 'doctor_portal/doctor_drawer.dart';
import 'doctor_portal/doctor_appointments.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
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
      routes: {
        '/login': (context) => LoginPage(),
        '/MyHomePage': (context) => MyHomePage(),
        '/DoctorDrawer': (context) => DoctorDrawer(),
        '/DoctorAppointments': (context) => DoctorAppointments(),
      },
    );
  }
}
