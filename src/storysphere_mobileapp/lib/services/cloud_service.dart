import 'dart:convert';
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

    if (response.statusCode == 200) {
      // Success
      return response;
    } else {
      // Error
      throw Exception('Failed to send review');
    }
  }

  
  

}
