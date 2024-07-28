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
}
