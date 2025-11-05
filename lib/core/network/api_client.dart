import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiClient {
  final String baseUrl;
  final http.Client _httpClient;
  ApiClient({required this.baseUrl, http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  //best use is this akta chnage sob gaijie use
  Map<String, String> get _defaultHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
  //re-useable get api call
  Future<dynamic> get(String path, {Map<String, String>? headers}) async{
    final uri = Uri.parse('$baseUrl$path');

    final mergedHeaders = {
      ..._defaultHeaders,
      if (headers != null) ...headers,
    };
    final response = await _httpClient.get(uri, headers: mergedHeaders);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    }
    //Error
    throw HttpException(
      message: 'Request failed',
      statusCode: response.statusCode,
      uri: uri,
      body: response.body,
    );
  }

  Future<dynamic> post(
      String path, {
        Map<String, String>? headers,
        Map<String, dynamic>? body,
      }) async {
    final uri = Uri.parse('$baseUrl$path');
    final mergedHeaders = {..._defaultHeaders, ...?headers};
    final response = await _httpClient.post(
      uri,
      headers: mergedHeaders,
      body: body != null ? jsonEncode(body) : null,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    }

    throw HttpException(
      message: 'Request failed',
      statusCode: response.statusCode,
      uri: uri,
      body: response.body,
    );
  }
}

class HttpException implements Exception {
  HttpException({
    required this.message,
    required this.statusCode,
    required this.uri,
    this.body,
  });

  final String message;
  final int statusCode;
  final Uri uri;
  final String? body;

  @override
  String toString() {
    return 'HttpException(statusCode: $statusCode, uri: $uri, message: $message)';
  }
}