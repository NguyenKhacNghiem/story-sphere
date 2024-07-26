import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class StoryService {
  static StoryService get shared => StoryService();
  static const String _apiGetById = APIUrlSerivces.storyById;

  Future<Story?> getStoryById(int storyId) async {
     final Uri uri = Uri.parse('$_apiGetById/$storyId');

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final result = temp['result'];
          Story? data = result.map((json) => Story.fromJson(json)).toList();
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
