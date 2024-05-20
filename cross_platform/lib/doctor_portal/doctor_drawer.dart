import 'package:cross_platform/doctor_portal/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cross_platform/reserve_appointment.dart';
import 'package:cross_platform/doctor_portal/doctor_appointments.dart';
import 'package:cross_platform/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:cross_platform/start_page.dart';

// Adjust the import path as necessary

class DoctorDrawer extends StatelessWidget {
  // Declare a member variable for the optional parameter
  final String? optionalParameter;

  // Modify the constructor to accept the optional parameter
  DoctorDrawer({Key? key, this.optionalParameter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double drawerWidth =
        screenWidth * 0.75; // Drawer covers 75% of the screen width

    final userProvider = Provider.of<UserProvider>(context);

    String firstName;
    if (optionalParameter != null) {
      firstName = optionalParameter!;
    } else {
      firstName = userProvider.fullName.split(' ')[0];
    }

    // String firstName = userProvider.fullName;

    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const ListTile(
              title: Text(
                'WELCOME TO OUR CLINIC',
                style: TextStyle(
                  color: Color.fromARGB(255, 82, 191, 245),
                  fontSize: 30,
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 82, 191, 245),
              thickness: 4,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: Text(
                'Doctor $firstName',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              tileColor: const Color.fromARGB(255, 236, 233, 233),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.person,
              ),
              title: const Text(
                'My Profile ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorProfile()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.timeline,
              ),
              title: const Text(
                'My Appointments',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorAppointments()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
              ),
              title: const Text(
                'Medical History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorAppointments()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              tileColor: Color.fromARGB(255, 233, 228, 228),
              title: const Text(
                'LOGOUT',
                style: TextStyle(
                  color: Color.fromARGB(255, 161, 12, 12),
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
