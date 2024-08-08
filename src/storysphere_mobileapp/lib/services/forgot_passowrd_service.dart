import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class ForgotPasswordService {
  static ForgotPasswordService get shared => ForgotPasswordService();
  static const String _apiUrl = APIUrlSerivces.verifyEmailService;
  static const String _apiResetpassword = APIUrlSerivces.forgotPasswordService;

  Future<http.Response> verifyEmail(String email) async {
    debugPrint(email);
    final url = Uri.parse(_apiUrl);
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      'email': email,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Success
      return response;
    } else {
      // Error
      throw Exception('Failed to send review');
    }
  }

  Future<http.Response> resetPassword(String email, String password, String confirmPassword) async {
    final url = Uri.parse(_apiResetpassword);
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Success
      return response;
    } else {
      // Error
      throw Exception('Failed to send review');
    }
  }

  

}
