import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/category.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class CategoryService {
  static CategoryService get shared => CategoryService();
  static const String _apiUrl = APIUrlSerivces.category;

  Future<List<Category>?> getAllCategory() async {
    

     final Uri uri = Uri.parse(_apiUrl);

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          
          List<Category>? data = result.map((json) => Category.fromJson(json)).toList();
          //debugPrint('Data length:' + data.length.toString());
          
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
