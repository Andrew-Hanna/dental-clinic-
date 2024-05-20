import 'package:flutter/material.dart';
import 'package:cross_platform/doctor_portal/bill.dart';

class Prescription extends StatefulWidget {
  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  String prescriptionText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'),
        backgroundColor: Color.fromARGB(255, 82, 191, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          // Center widget
          child: Expanded(
            // Expanded widget
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center children vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center children horizontally
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Prescription',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 82, 191, 245),
                    ),
                  ),
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      prescriptionText = value;
                    });
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 82, 191, 245)),
                    // Set the button text color to black
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {
                    // TODO: Save prescription logic
                    // Navigate to the bill screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bill()),
                    );
                    // TODO: Save prescription logic
                  },
                  child: Text(
                    'Save Prescription',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
