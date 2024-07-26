import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class SearchingService {
  static SearchingService get shared => SearchingService();
  static const String _apiUrl = APIUrlSerivces.filter;
  static const String _apiSearch = APIUrlSerivces.search;

  Future<PaginationResult?> getStoriesByCategory(int categoryId, int? page) async {
    final Map<String, String> queryParams = {
      'categoryId': categoryId.toString(),
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
          //debugPrint(result.toString());
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

   Future<PaginationResult?> searchStories(String searchContent, int? page) async {
    final Map<String, String> queryParams = {
      'searchContent': searchContent.toString(),
      if (page!= null) 'page': page.toString(),
    };

     final Uri uri = Uri.parse(_apiSearch).replace(queryParameters: queryParams);

     try {
        final http.Response response = await http.get(uri);
        

        if (response.statusCode == 200) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          final currentPage = temp['currentPage'];
          final totalPage = temp['totalPages'];
          //debugPrint(result.toString());
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

}
