import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _userRole = '';
  String _fullName = '';
  String _email = '';

  String get userRole => _userRole;
  String get fullName => _fullName;
  String get email => _email;

  void setUserRole(String role) {
    _userRole = role;
    notifyListeners();
  }

  void setUserInfo(String fullName, String email) {
    _fullName = fullName;
    _email = email;
    notifyListeners();
  }
}
