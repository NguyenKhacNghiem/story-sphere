import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class StoryService {
  static StoryService get shared => StoryService();
  static const String _apiUrl = APIUrlSerivces.story;

  Future<Story?> getStoryById(int storyId) async {
     final Uri uri = Uri.parse('$_apiUrl/id/$storyId');

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

  Future<List<Story>?> getStoryByFavGenre(int userId) async {
    final Map<String, String> queryParams = {
      'userId': userId.toString(),
    };

    final Uri uri = Uri.parse('$_apiUrl/favorite-category').replace(queryParameters: queryParams);
    debugPrint(uri.toString());
    try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          
          List<Story>? data = result.map((json) => Story.fromJson(json)).toList();
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

  Future<List<Story>?> getHorStories() async {
     final Uri uri = Uri.parse('$_apiUrl/most-view');

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          List<Story>? data = result.map((json) => Story.fromJson(json)).toList();
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
  
  Future<List<Story>?> getMostRating() async {
    final Map<String, String> queryParams = {
      'ratingPoint': '5',
    };

     final Uri uri = Uri.parse('$_apiUrl/filter').replace(queryParameters: queryParams);

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          //debugPrint(result.toString());
          List<Story>? data = result.map((json) => Story.fromJson(json)).toList();

        
          return data.take(5).toList();
        } else {
          debugPrint('Failed to load stories: ${response.statusCode}');
          return null;
        }
      } catch (e) {
        debugPrint('Error occurred: $e');
        return null;
      }
  }

   
  Future<List<Story>?> recentlyUpdated() async {
    final Map<String, String> queryParams = {
      'isLastUpdated': 'true',
    };

     final Uri uri = Uri.parse('$_apiUrl/filter').replace(queryParameters: queryParams);

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          //debugPrint(result.toString());
          List<Story>? data = result.map((json) => Story.fromJson(json)).toList();

        
          return data.take(5).toList();
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
