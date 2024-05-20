import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cross_platform/doctor_portal/prescription.dart';

class DoctorAppointments extends StatefulWidget {
  @override
  _DoctorAppointmentsState createState() => _DoctorAppointmentsState();
}

class _DoctorAppointmentsState extends State<DoctorAppointments> {
  List<Widget> generateTiles(List<dynamic> data) {
    return data.map((item) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Prescription()),
            );
          },
          leading: Icon(
            Icons.calendar_today,
            color: Color.fromARGB(255, 82, 191, 245),
          ),
          title: Text(
            item['title'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 82, 191, 245),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5), // Add space between title and subtitle
              Text(
                item['subtitle'],
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5), // Add space between subtitle text and time
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(width: 5), // Space between icon and time text
                  Text(
                    item['scheduled_time'],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 82, 191, 245),
            ),
            onPressed: () {
              print('delete');
            },
          ),
        ),
      );
    }).toList();
  }

  // Define a list of maps
  List<Map<String, dynamic>> data = [
    {
      'title': 'Appointment 1',
      'subtitle': 'Dr. Smith',
      'scheduled_time': '2024-05-15T00:24:28.923Z',
    },
    {
      'title': 'Appointment 2',
      'subtitle': 'Dr. Johnson',
      'scheduled_time': '2024-05-15T00:24:28.923Z',
    },
    {
      'title': 'Appointment 3',
      'subtitle': 'Dr. Johnson',
      'scheduled_time': '2024-05-15T00:24:28.923Z',
    },
    {
      'title': 'Appointment 4',
      'subtitle': 'Dr. Johnson',
      'scheduled_time': '2024-05-15T00:24:28.923Z',
    },
    // Add more maps as needed
  ];

// Function to generate tiles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctor Appointments'),
          backgroundColor: Color.fromARGB(255, 82, 191, 245),
        ),
        body: Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: generateTiles(
                    data), // replace 'yourData' with your actual data
              ),
            ),
          ),
        ));
  }
}
