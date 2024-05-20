import 'package:cross_platform/doctor_portal/doctor_drawer.dart';
import 'package:flutter/material.dart';

class ListOfDoctors extends StatelessWidget {
  // Replace this function with your actual data fetching function
  List<Map<String, dynamic>> getDoctors() {
    return [
      {'id': 1, 'name': 'John Doe'},
      {'id': 2, 'name': 'Jane Smith'},
      {'id': 3, 'name': 'Robert Johnson'},
    ];
  }

  void onDoctorCellPressed(Map<String, dynamic> doctor) {
    print('Doctor ID: ${doctor['id']}, Name: ${doctor['name']}');
    // You can add more functionality here, like navigating to a detail page or showing a dialog
  }

  @override
  Widget build(BuildContext context) {
    // Call the external function to get the list of doctors and their IDs
    List<Map<String, dynamic>> doctors = getDoctors();

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Doctors'),
        backgroundColor: Color.fromARGB(255, 82, 191, 245),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Center(
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Center(
                            child: Text(
                          ' ID',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 82, 191, 245),
                          ),
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'Doctor Name',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 82, 191, 245)),
                        )),
                      ),
                    ],
                    rows: doctors
                        .map(
                          (doctor) => DataRow(
                            cells: [
                              DataCell(
                                Center(child: Text(doctor['id'].toString())),
                                onTap: () {
                                  onDoctorCellPressed(doctor);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorDrawer(
                                              optionalParameter: doctor['name'],
                                            )),
                                  );
                                },
                              ),
                              DataCell(Center(child: Text(doctor['name'])),
                                  onTap: () {
                                onDoctorCellPressed(doctor);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoctorDrawer()),
                                );
                              }),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
