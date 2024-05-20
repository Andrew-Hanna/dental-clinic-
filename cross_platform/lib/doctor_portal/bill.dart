import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bill extends StatefulWidget {
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  TextEditingController _billController = TextEditingController();

  void _saveBill() async {
    final String apiUrl =
        'http://10.0.2.2:8000/bills/'; // Replace with your backend URL

    Map<String, dynamic> data = {
      "patient_id": 10, // Replace with the actual patient ID
      "amount_due": double.parse(_billController.text),
      "due_date": "2024-05-20", // Replace with the actual due date
      // If you want to set a specific status, include it here:
      "status": "unpaid" // Optional, replace with the desired status
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, the bill was created successfully.
      print('Bill created successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bill saved successfully')),
      );
    } else {
      print(response.body);
      // If the server returns an error response, show an error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save bill')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill'),
        backgroundColor: Color.fromARGB(255, 82, 191, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _billController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Bill',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 82, 191, 245),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 82, 191, 245)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: _saveBill,
                child: Text(
                  'Save Bill',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
