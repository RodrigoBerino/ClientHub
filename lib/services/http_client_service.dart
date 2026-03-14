import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClientService {
  final http.Client client;

  HttpClientService(this.client);

  Future<dynamic> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  Future<dynamic> post(String url, dynamic data) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {'accept': 'application/json', 'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> put(String url, dynamic data) async {
    final response = await client.put(
      Uri.parse(url),
      headers: {'accept': 'application/json', 'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> delete(String url) async {
    final response = await client.delete(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
