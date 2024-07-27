import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/comment.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class CommentService {
  static CommentService get shared => CommentService();
  static const String _apiUrl = APIUrlSerivces.comment;

  
  Future<PaginationResult<Comment>?> getCommentByChapter(int chapterId, int? page) async {
    final Map<String, String> queryParams = {
      'chapterId': chapterId.toString(),
       if (page!= null) 'page': page.toString(),
    };

    final Uri uri = Uri.parse(_apiUrl).replace(queryParameters: queryParams);

    try {
        final http.Response response = await http.get(uri);
         

        if (response.statusCode == 200) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          if (temp['result'] != null) {
            final List<dynamic> result = temp['result'];
            final currentPage = temp['currentPage'];
            final totalPage = temp['totalPages'];
            List<Comment> data = result.map((json) => Comment.fromJson(json)).toList();   

            
            PaginationResult<Comment> paginationResult = PaginationResult(result: data, currentPage: currentPage, totalPages: totalPage);

            return paginationResult;
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

}
