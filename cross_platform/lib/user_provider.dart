import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _userRole = '';
  String _fullName = '';
  String _email = '';
  String _token = '';
  int _userId = 0;
  String _dob = '';
  String _gender = '';
  String _phoneNumber = '';
  String _address = '';

  String get userRole => _userRole;
  String get fullName => _fullName;
  String get email => _email;
  String get token => _token;
  int get userId => _userId;
  String get dob => _dob;
  String get gender => _gender;
  String get phoneNumber => _phoneNumber;
  String get address => _address;

  void setUserRole(String role) {
    _userRole = role;
    notifyListeners();
  }

  void setUserInfo(
    String fullName,
    String email,
    String token,
    int userId,
  ) {
    _fullName = fullName;
    _email = email;
    _token = token;
    _userId = userId;
    notifyListeners();
  }
}
