import 'package:cross_platform/patient_drawer.dart';
import 'package:flutter/material.dart';

class ListOfPatients extends StatelessWidget {
  // Replace this function with your actual data fetching function
  List<Map<String, dynamic>> getPatients() {
    return [
      {'id': 1, 'name': 'John Doe'},
      {'id': 2, 'name': 'Jane Smith'},
      {'id': 3, 'name': 'Robert Johnson'},
    ];
  }

  void onPatientCellPressed(Map<String, dynamic> patient) {
    print('Patient ID: ${patient['id']}, Name: ${patient['name']}');
    // You can add more functionality here, like navigating to a detail page or showing a dialog
  }

  @override
  Widget build(BuildContext context) {
    // Call the external function to get the list of patients and their IDs
    List<Map<String, dynamic>> patients = getPatients();

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Patients'),
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
                          'Patient Name',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 82, 191, 245)),
                        )),
                      ),
                    ],
                    rows: patients
                        .map(
                          (patient) => DataRow(
                            cells: [
                              DataCell(
                                Center(child: Text(patient['id'].toString())),
                                onTap: () {
                                  onPatientCellPressed(patient);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PatientDrawer(
                                              optionalParameter:
                                                  patient['name'])));
                                },
                              ),
                              DataCell(Center(child: Text(patient['name'])),
                                  onTap: () {
                                onPatientCellPressed(patient);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientDrawer(
                                          optionalParameter: patient['name'])),
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
