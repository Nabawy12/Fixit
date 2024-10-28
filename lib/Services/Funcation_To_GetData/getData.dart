import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> callApi({
  required String url,
  required String method,
  Map<String, dynamic>? bodyData,
  Map<String, String>? headers,
  bool parseResponse = false,
  Function(dynamic)? onSuccess,
  Function()? onError,
  Function()? onLoading,
}) async {
  try {
    if (onLoading != null) {
      onLoading();
    }

    bodyData ??= {};

    final prefs = await SharedPreferences.getInstance();
    String appLanguage = prefs.getString('languageCode') ?? 'en';

    bodyData['language'] = appLanguage;

    late http.Response response;
    switch (method) {
      case 'POST':
        response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(bodyData),
        );
        break;
      case 'GET':
        response = await http.get(
          Uri.parse(url),
          headers: headers,
        );
        break;
      case 'PUT':
        response = await http.put(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(bodyData),
        );
        break;
      case 'DELETE':
        response = await http.delete(
          Uri.parse(url),
          headers: headers,
        );
        break;
      default:
        throw Exception('Unsupported HTTP method');
    }

    if (response.statusCode == 200) {
      if (parseResponse && onSuccess != null) {
        dynamic jsonResponse;
        try {
          jsonResponse = jsonDecode(response.body);
        } catch (e) {
          jsonResponse = response.body;
        }
        onSuccess(jsonResponse);
      } else if (onSuccess != null) {
        onSuccess(response.body);
      }
    } else {
      if (onError != null) {
        onError();
      }
      throw Exception('Failed to perform API call with status code: ${response.body}');
    }
  } catch (e) {
    if (onError != null) {
      onError();
    }
  }
}
