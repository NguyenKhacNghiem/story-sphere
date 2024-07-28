import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class ChapterService {
  static ChapterService get shared => ChapterService();
  static const String _apiChapter = APIUrlSerivces.chapter;


//GET API REQUESTS
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

  Future<Chapter?> getChapterById(int id) async {
     final Uri uri = Uri.parse('$_apiChapter/$id');

     try {
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final result = temp['result'];
          Chapter? data = Chapter.fromJson(result);   

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

  //POST API REQUESTS
  Future<http.Response> createChapter(Chapter chapter) async {
    final url = Uri.parse('$_apiChapter/create');
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      'fk_storyId': chapter.fkStoryId,
      'chapterName': chapter.chapterName,
      'chapterContent': chapter.chapterContent,
      'chapterUrlKey': chapter.chapterUrlKey,
      'chapterOrder': chapter.chapterOrder,
      'matureContent': chapter.matureContent,
      'wordsCount': chapter.wordsCount,
      'commercialActivated': chapter.commercialActivated,
      'chapterSellPrice': chapter.chapterSellPrice,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Success
      return response;
    } else {
      // Error
      throw Exception('Failed to send review');
    }
  }
}
