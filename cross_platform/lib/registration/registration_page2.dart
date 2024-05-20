import 'package:cross_platform/home_page/my_home_page.dart';
import 'package:cross_platform/registration/sign_up.dart';
import 'package:flutter/material.dart';
import '/api_service.dart'; // Import the API service
import 'package:provider/provider.dart';
import '/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage2 extends StatefulWidget {
  final String username, email, password;
  RegistrationPage2(this.username, this.email, this.password);

  @override
  _RegistrationPage2State createState() => _RegistrationPage2State();
}

class _RegistrationPage2State extends State<RegistrationPage2> {
  final _formKey = GlobalKey<FormState>();
  late String fullName, dob = '', gender = '', address, phoneNumber;
  DateTime selectedDate = DateTime.now();

  final List<String> genders = ['Male', 'Female'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dob = "${picked.toLocal()}"
            .split(' ')[0]; // Format and set the date of birth
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Color(0xFF52BFF5);

    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Registration"),
        backgroundColor: themeColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.person_outline, color: themeColor),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) => fullName = value!,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: TextEditingController(text: dob),
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.calendar_today, color: themeColor),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.transgender, color: themeColor),
                ),
                value: gender.isEmpty ? null : gender,
                onChanged: (String? newValue) {
                  setState(() {
                    gender = newValue!;
                  });
                },
                items: genders.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Please select your gender' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.home, color: themeColor),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) => address = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.phone, color: themeColor),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
                onSaved: (value) => phoneNumber = value!,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: themeColor,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      var registerResponse = await ApiService().registerUser(
                        widget.username,
                        widget.email,
                        widget.password,
                        fullName,
                        dob,
                        gender,
                        address,
                        phoneNumber,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(registerResponse['message'])),
                      );

                      var loginResponse = await ApiService()
                          .loginUser(widget.username, widget.password);
                      print('login response');
                      String userRole = loginResponse[
                          'role']; // Get the role from the login response
                      Provider.of<UserProvider>(context, listen: false)
                          .setUserRole(
                              userRole); // Set the user role in the provider
                      Provider.of<UserProvider>(context, listen: false)
                          .setUserInfo(
                              widget.username,
                              widget
                                  .email); // Set the user info in the provider

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Registration or login failed')),
                      );
                    }
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
