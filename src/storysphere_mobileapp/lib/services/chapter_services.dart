import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class ChapterService {
  static ChapterService get shared => ChapterService();
  static const String _apiChapter = APIUrlSerivces.chapter;

 Future<PaginationResult?> getChaptesrByStoryId(int storyId, int? page) async {
    final Map<String, String> queryParams = {
      'fk_storyId': storyId.toString(),
      if (page!= null) 'page': page.toString(),
    };

     final Uri uri = Uri.parse(_apiChapter).replace(queryParameters: queryParams);

     debugPrint(uri.toString());

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final List<dynamic> result = temp['result'];
          final currentPage = temp['currentPage'];
          final totalPage = temp['totalPages'];
          debugPrint(result.toString());
          List<Chapter> data = result.map((json) => Chapter.fromJson(json)).toList();   

          
          PaginationResult<Chapter> paginationResult = PaginationResult(result: data, currentPage: currentPage, totalPages: totalPage);

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
