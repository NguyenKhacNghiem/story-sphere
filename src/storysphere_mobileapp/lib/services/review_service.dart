import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/models/review.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class ReviewService {
  static ReviewService get shared => ReviewService();
  static const String _apiUrl = APIUrlSerivces.review;

  
  Future<PaginationResult<Review>?> getReviewByStoryId(int storyId , int? page) async {
    final Map<String, String> queryParams = {
      'storyId': storyId.toString(),
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
            List<Review> data = result.map((json) => Review.fromJson(json)).toList();   

            
            PaginationResult<Review> paginationResult = PaginationResult(result: data, currentPage: currentPage, totalPages: totalPage);

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
