import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/models/reading_history.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class ReadingHistoryService {
  static ReadingHistoryService get shared => ReadingHistoryService();
  static const String _apiUrl = APIUrlSerivces.readingHistory;

  Future<PaginationResult<ReadingHistory>?> getHistoryByUserId(int userId, int? page) async {
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
          
          List<ReadingHistory>? data = result.map((json) => ReadingHistory.fromJson(json)).toList();

          
          PaginationResult<ReadingHistory> paginationResult = PaginationResult(result: data, currentPage: currentPage, totalPages: totalPage);

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
