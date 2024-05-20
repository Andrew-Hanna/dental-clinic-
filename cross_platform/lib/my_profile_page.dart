import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';
import 'api_service.dart';
import 'package:intl/intl.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  // Initial values for the profile information
  String username = '';
  String email = '';
  String fullName = '';
  String address = '';
  String phoneNumber = '';
  DateTime dob = DateTime.now();
  String gender = '';

  final List<String> genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  void _fetchUserProfile() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final userInfo = await apiService.getUserInfo(userProvider.token);
      setState(() {
        username = userInfo['username'] ?? '';
        email = userInfo['email'] ?? '';
        fullName = userInfo['full_name'] ?? '';
        address = userInfo['address'] ?? '';
        phoneNumber = userInfo['phone'] ?? '';
        dob = userInfo['dob'] != null
            ? DateTime.parse(userInfo['dob'])
            : DateTime.now();
        gender = userInfo['gender'] ?? '';
      });
      userProvider.setUserInfo(
        fullName,
        email,
        userProvider.token,
        userProvider.userId,
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch user profile')),
      );
    }
  }

  void _updateUserProfile() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final updateData = {
        'username': username,
        'email': email,
        'full_name': fullName,
        'address': address,
        'phone': phoneNumber,
        'dob': DateFormat('yyyy-MM-dd').format(dob),
        'gender': gender,
      };
      await apiService.updateUserProfile(userProvider.token, updateData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dob) {
      setState(() {
        dob = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final themeColor = Color(0xFF52BFF5);

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
                    _updateUserProfile();
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
              GestureDetector(
                onTap: () => isEditing ? _selectDate(context) : null,
                child: AbsorbPointer(
                  child: _buildProfileField(
                    label: 'Date of Birth',
                    initialValue: DateFormat('yyyy-MM-dd').format(dob),
                    enabled: isEditing,
                    onSaved: (value) =>
                        dob = DateFormat('yyyy-MM-dd').parse(value!),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.transgender, color: themeColor),
                ),
                value: gender.isEmpty ? null : gender,
                onChanged: isEditing
                    ? (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                      }
                    : null,
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
