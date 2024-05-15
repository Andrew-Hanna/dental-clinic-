import 'package:cross_platform/admin_portal/admin_drawer.dart';
import 'package:cross_platform/doctor_portal/doctor_drawer.dart';
import 'package:cross_platform/home_page/services.dart';
import 'package:cross_platform/my_app_bar.dart';
import 'package:cross_platform/patient_drawer.dart';
import 'package:cross_platform/home_page/open_hours.dart';
import 'package:flutter/material.dart';
import 'package:cross_platform/my_app_bar.dart';
import 'package:cross_platform/home_page/features.dart';
import 'package:cross_platform/home_page/animated_images.dart';
import 'package:cross_platform/home_page/footer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DoctorDrawer(),
      drawer: AdminDrawer(),
      // drawer: PatientDrawer(),
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
