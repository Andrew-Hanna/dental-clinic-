import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'http://localhost:8000'; // Replace with your machine's IP address

  Future<Map<String, dynamic>> registerUser(
      String username,
      String email,
      String password,
      String fullName,
      String dob,
      String gender,
      String address,
      String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register/'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': username,
        'email': email,
        'password': password,
        'full_name': fullName,
        'dob_str': dob,
        'gender': gender,
        'address': address,
        'phone': phoneNumber,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    print('ya mosahelllllll');
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> getUserInfo(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user_info'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user info');
    }
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/forgot-password/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to send password reset email');
    }
  }

  Future<Map<String, dynamic>> resetPassword(
      String token, String newPassword) async {
    final response = await http.post(
      Uri.parse(
          '$baseUrl/reset-password/?token=$token&new_password=$newPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    print(
        "Request URL: ${Uri.parse('$baseUrl/reset-password/?token=$token&new_password=$newPassword')}"); // Debug print statement

    if (response.statusCode == 200) {
      print("Response Body: ${response.body}"); // Debug print statement
      return jsonDecode(response.body);
    } else {
      print("Response Body: ${response.body}"); // Debug print statement
      throw Exception('Failed to reset password');
    }
  }

  Future<List<dynamic>> fetchDoctors(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/doctors/'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    print("Response Body: ${response.body}"); // Debug print statement

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  Future<Map<String, dynamic>> scheduleAppointment(
    String token,
    int patientId,
    String patientName,
    int doctorId,
    String doctorName,
    DateTime scheduledTime,
    String? notes,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/appointments/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'doctor_id': doctorId,
        'scheduled_time': scheduledTime.toIso8601String(),
        'notes': notes,
      }),
    );

    print("Request Payload: ${jsonEncode(<String, dynamic>{
          'doctor_id': doctorId,
          'scheduled_time': scheduledTime.toIso8601String(),
          'notes': notes,
        })}"); // Debug print statement

    if (response.statusCode == 200) {
      print("Response Body: ${response.body}"); // Debug print statement
      return jsonDecode(response.body);
    } else {
      print("Response Body: ${response.body}"); // Debug print statement
      throw Exception('Failed to schedule appointment');
    }
  }

  Future<Map<String, dynamic>> updateUserProfile(
      String token, Map<String, dynamic> updateData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/me/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(updateData),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user profile');
    }
  }

  // Other API methods like fetchDoctors, etc.
}
