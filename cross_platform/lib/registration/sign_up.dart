import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> registerUser(
    String username,
    String email,
    String password,
    String fullName,
    String dob,
    String gender,
    String address,
    String phoneNumber) async {
  final url = Uri.parse('http://10.0.2.16:8000/register/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'email': email,
      'password': password,
      'full_name': fullName,
      'dob': dob,
      'gender': gender,
      'address': address,
      'phone': phoneNumber,
    }),
  );

  if (response.statusCode == 200) {
    // Handle successful registration
    print('Registration successful');
  } else {
    // Handle error
    throw Exception('Failed to register. Status code: ${response.statusCode}');
  }
}
