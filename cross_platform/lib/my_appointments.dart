import 'package:flutter/material.dart';
import 'edit_appointment.dart';

class MyAppointmentsPage extends StatefulWidget {
  @override
  _MyAppointmentsPageState createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {
  List<Map<String, String>> appointments = [
    {
      'date': '2024-05-15',
      'time': '10:00 AM',
      'service': 'Dental Checkup',
    },
    {
      'date': '2024-05-16',
      'time': '11:00 AM',
      'service': 'Teeth Cleaning',
    },
    {
      'date': '2024-05-17',
      'time': '02:00 PM',
      'service': 'Root Canal Treatment',
    },
    {
      'date': '2024-05-26',
      'time': '11:00 AM',
      'service': 'Tooth Extraction',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointments'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Service: ${appointment['service']}'),
              subtitle: Text(
                  'Date: ${appointment['date']} at ${appointment['time']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditAppointmentPage(appointment: appointment),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          appointments[index] = {
                            'date': result['date'],
                            'time': result['time'],
                            'service': result['service']
                          };
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _confirmDelete(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text(
              "Are you sure you want to delete the appointment on ${appointments[index]['date']} at ${appointments[index]['time']}?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                setState(() {
                  appointments.removeAt(index);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
