import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class CloudService {
  static CloudService get shared => CloudService();
  static const String _apiUrl = APIUrlSerivces.cloudService;

  Future<http.Response> uploadFile(XFile file) async {
    final url = Uri.parse('$_apiUrl/upload-image');
    final headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> data = {
      'file ': file,
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

  Future<String?> uploadImage(XFile? _image) async {
    if (_image == null) {
      debugPrint ('No image selected.');
      return null;
    }

    final uri = Uri.parse('$_apiUrl/upload-image'); // Replace with your backend URL
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', _image.path)); // Convert XFile to File path

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseBody);

      if (response.statusCode == 200) {
        debugPrint('File uploaded successfully.');
        debugPrint('Server response: ${responseJson['message']}');
        debugPrint('File URL: ${responseJson['url']}');
        return responseJson['url'];
      } else {
        debugPrint('Failed to upload file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error uploading file: $e');
    }
  }
  

}
