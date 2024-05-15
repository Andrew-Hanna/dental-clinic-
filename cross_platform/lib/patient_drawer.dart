// import 'package:cross_platform/billing_details_page.dart';
import 'package:cross_platform/billing/type_of_billing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cross_platform/reserve_appointment.dart';
import 'package:cross_platform/my_appointments.dart';
import 'package:cross_platform/my_profile_page.dart'; // Add this import
import 'package:cross_platform/billing/billing.dart'; // Add this import

class PatientDrawer extends StatelessWidget {
  PatientDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double drawerWidth =
        screenWidth * 0.75; // Drawer covers 75% of the screen width

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
              title: const Text(
                'My Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfilePage()),
                );
              },
              tileColor: const Color.fromARGB(255, 236, 233, 233),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfilePage()),
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
                  MaterialPageRoute(builder: (context) => MyAppointmentsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.prescriptionBottleMedical,
              ),
              title: const Text(
                'My Prescriptions',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.fileInvoiceDollar,
              ),
              title: const Text(
                'Billing Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TypeOfBilling()),
                );
              },
            ),
            const ListTile(
              title: Text(
                'Services',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              tileColor: Color.fromARGB(255, 236, 233, 233),
            ),
            _createServiceListTile(
                context, 'Dental checkup', Icons.check_circle),
            _createServiceListTile(context, 'Teeth cleaning', Icons.brush),
            _createServiceListTile(
                context, 'Tooth extraction', Icons.remove_circle),
            _createServiceListTile(
                context, 'Root canal treatment', Icons.healing),
            _createServiceListTile(
                context, 'Orthodontics', FontAwesomeIcons.faceSmile),
            _createServiceListTile(
                context, 'Teeth braces', FontAwesomeIcons.teeth),
          ],
        ),
      ),
    );
  }

  ListTile _createServiceListTile(
      BuildContext context, String serviceName, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        serviceName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ReserveAppointmentPage(serviceName: serviceName)),
        );
      },
    );
  }
}
