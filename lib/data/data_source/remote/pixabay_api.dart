import 'dart:convert';
import 'package:image_search_app_practice/data/data_source/remote/image_api.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements ImageApi {
  final String _baseUrl = 'https://pixabay.com/api/?key=41485709-10bae150ab77c646c4aade16f&image_type=photo';

  Future<Map<String, dynamic>> queryImage(String? query) async {
    final String url = query == null ? _baseUrl : '$_baseUrl&q=$query';
    final http.Response response = await http.get(Uri.parse(url));

    return jsonDecode(response.body);
  }
}