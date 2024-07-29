import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class AccountService {
  static AccountService get shared => AccountService();
  static const String _apiUrl= APIUrlSerivces.account;

 Future<User?> getUserById(int id) async {
     final Uri uri = Uri.parse('$_apiUrl/profile/$id');

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

  Future<http.Response> register(String username, String password, String confirmPassword, String email) async {
    final url = Uri.parse('$_apiUrl/register');
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
      'confirmPassword': confirmPassword,
      'email': email,
    };

    debugPrint(url.toString());

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    debugPrint(response.body);

    if (response.statusCode == 200) {
      // Success
      return response;
    } else {
      // Error
      throw Exception('Failed to send review');
    }
  }

  Future<http.Response> updateProfile(int userId, String displayName, String introduction, DateTime dateOfBirth) async {
    final url = Uri.parse('$_apiUrl/profile');
    final headers = {'Content-Type': 'application/json'};
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateOfBirth);
    final Map<String, dynamic> data = {
      '_id': userId,
      'displayName': displayName,
      'selfIntroduction': introduction,
      'dateOfBirth': formattedDate,
    };

    debugPrint('${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}');

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
