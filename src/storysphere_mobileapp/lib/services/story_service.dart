import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class StoryService {
  static StoryService get shared => StoryService();
  static const String _apiUrl = APIUrlSerivces.story;
  static const String _apiSearch = APIUrlSerivces.search;


//GET API REQUESTS
  Future<Story?> getStoryById(int storyId) async {
     final Uri uri = Uri.parse('$_apiUrl/$storyId');

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final result = temp['result'];
          Story? data = Story.fromJson(result);
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

  Future<PaginationResult<Story>?> getStoriesByUserId(int userId, int? page) async {
    final Map<String, String> queryParams = {
      'userId': userId.toString(),
      if (page!= null) 'page': page.toString(),
    };

     final Uri uri = Uri.parse(_apiUrl).replace(queryParameters: queryParams);

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          final currentPage = temp['currentPage'];
          final totalPage = temp['totalPages'];
          List<Story>? data = result.map((json) => Story.fromJson(json)).toList();

          
          PaginationResult<Story> paginationResult = PaginationResult(result: data, currentPage: currentPage, totalPages: totalPage);

          return paginationResult;
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

    try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          if (temp['result'] != null) {
            final List<dynamic> result = temp['result'];
          
            List<Story>? data = result.map((json) => Story.fromJson(json)).toList();
            return data;
          } else {
            return null;
          }
          

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

  //POST API REQUESTS
  
  Future<http.Response> createStory(Story story) async {
  final url = Uri.parse('$_apiUrl/create');
  final headers = {'Content-Type': 'application/json'};
  final Map<String, dynamic> data = {
    'storyName': story.storyName,
    'url': story.storyName,
    'cover': story.storyCover,
    'contentOutline': story.storyContentOutline,
    'fk_publisherAccount': story.fkPublisherAccount,
    'authorName': story.bookAuthorName,
    'publisherName': story.bookPublisherName,
    'ISBNcode': story.bookISBNcode,
    'publishDate': story.bookPublishDate!.toIso8601String(),
    'categoriesAndTags': story.categoriesAndTags,
    'selfComposedStory': story.selfComposedStory,
    'matureContent': story.matureContent,
    'chapterCount': story.chapterCount,
    'commercialActivated':story.commercialActivated,
    'storySellPrice': story.storySellPrice,
  };

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

}
