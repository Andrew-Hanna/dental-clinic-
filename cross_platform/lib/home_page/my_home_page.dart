import 'package:flutter/material.dart';
import 'package:cross_platform/admin_portal/admin_drawer.dart';
import 'package:cross_platform/doctor_portal/doctor_drawer.dart';
import 'package:cross_platform/patient_drawer.dart';
import 'package:cross_platform/home_page/services.dart';
import 'package:cross_platform/my_app_bar.dart';
import 'package:cross_platform/home_page/open_hours.dart';
import 'package:cross_platform/home_page/features.dart';
import 'package:cross_platform/home_page/animated_images.dart';
import 'package:cross_platform/home_page/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/user_provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userRole = Provider.of<UserProvider>(context)
        .userRole; // Get the user role from the provider

    Widget drawer;
    print(userRole);

    // Determine which drawer to show based on the user role
    if (userRole == 'admin') {
      drawer = AdminDrawer();
    } else if (userRole == 'doctor') {
      drawer = DoctorDrawer();
    } else if (userRole == 'patient') {
      drawer = PatientDrawer();
    } else {
      drawer = Drawer(); // Default empty drawer
    }

    return Scaffold(
      drawer: drawer, // Set the determined drawer
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedImages(),
            OpenHours(),
            SizedBox(
              height: 60,
            ),
            Text(
              'Features',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontFamily: 'Serif',
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 82, 191, 245),
              thickness: 4,
              indent: 180,
              endIndent: 180,
            ),
            Features(),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 233, 233)),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'Serif',
                    ),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 82, 191, 245),
                    thickness: 4,
                    indent: 180,
                    endIndent: 180,
                  ),
                  services(),
                  SizedBox(
                    height: 60,
                  ),
                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
