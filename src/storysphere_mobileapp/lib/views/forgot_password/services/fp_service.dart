import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storysphere_mobileapp/routing/api_services_url.dart';


class ForgotPasswordService {
  static const String _apiUrl = APIUrlSerivces.forgotPasswordService;

  Future<bool> verifyEmail(String email) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      if (responseData['code'] == 0 || responseData['code'] == 100) {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to verify email');
    }
  }


}
