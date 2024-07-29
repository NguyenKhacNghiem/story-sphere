import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class LoginService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _apiUrl = APIUrlSerivces.loginService;


  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      final responseData = json.decode(response.body);

      if (responseData['code'] == 0 || responseData['code'] == 100) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('userId', responseData['userId']);
        await prefs.setBool(_isLoggedInKey, true);
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<void> setLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isLoggedInKey);
    await prefs.remove('userId');
  }
}
