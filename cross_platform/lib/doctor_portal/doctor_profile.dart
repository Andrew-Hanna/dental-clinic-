import 'package:flutter/material.dart';
import 'package:cross_platform/user_provider.dart';
import 'package:provider/provider.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    String firstName = userProvider.fullName;

    final themeColor = Color(0xFF52BFF5);

    // Initial values for the profile information
    String username = userProvider.fullName.split(' ')[0];
    String email = userProvider.email;
    String fullName = userProvider.fullName;
    String address = '123 Main St, Anytown, USA';
    String phoneNumber = '1234567890';

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: themeColor,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                if (isEditing) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save the updated profile information
                    // Perform any additional save operations here
                  }
                }
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildProfileField(
                label: 'Username',
                initialValue: username,
                enabled: isEditing,
                onSaved: (value) => username = value!,
              ),
              SizedBox(height: 20),
              _buildProfileField(
                label: 'Email',
                initialValue: email,
                enabled: isEditing,
                onSaved: (value) => email = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildProfileField(
                label: 'Full Name',
                initialValue: fullName,
                enabled: isEditing,
                onSaved: (value) => fullName = value!,
              ),
              SizedBox(height: 20),
              _buildProfileField(
                label: 'Address',
                initialValue: address,
                enabled: isEditing,
                onSaved: (value) => address = value!,
              ),
              SizedBox(height: 20),
              _buildProfileField(
                label: 'Phone Number',
                initialValue: phoneNumber,
                enabled: isEditing,
                onSaved: (value) => phoneNumber = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required String label,
    required String initialValue,
    required bool enabled,
    required FormFieldSetter<String> onSaved,
    FormFieldValidator<String>? validator,
  }) {
    final themeColor = Color(0xFF52BFF5);

    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: themeColor,
        ),
      ),
      enabled: enabled,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
