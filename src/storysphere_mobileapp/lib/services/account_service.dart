import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class AccountService {
  static AccountService get shared => AccountService();
  static const String _apiUrl= APIUrlSerivces.account;

 Future<User?> getUserById(int id) async {
     final Uri uri = Uri.parse('$_apiUrl/$id');

     debugPrint(uri.toString());

     try {
        final http.Response response = await http.get(uri);
        debugPrint(response.body);

        if (response.statusCode == 200) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final result = temp['result'];
          User? data = User.fromJson(result);   

          return data;
        } else {
          debugPrint('Failed to load stories: ${response.statusCode}');
          return null;
        }
      } catch (e) {
        debugPrint('Error occurred: $e');
        return null;
      }
  }

  Future<http.Response> register(int username, String password, String confirmPassword, String email) async {
    final url = Uri.parse('$_apiUrl/register');
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
      'confirmPassword': confirmPassword,
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

  Future<http.Response> login(int username, String password) async {
    final url = Uri.parse('$_apiUrl/register');
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
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

  Future<http.Response> updateProfile(User user) async {
    final url = Uri.parse('$_apiUrl/register');
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      '_id': user.userId,
      'displayName': user.displayName,
      'selfIntroduction': user.selfIntroduction,
      'dateOfBirth': user.dateOfBirth,
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 204 ) {
      // Success
      return response;
    } else {
      // Error
      throw Exception('Failed to send review');
    }
  }
  
}
