import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_practice/dto/pixabay_search_response.dart';

class PixabayAPi {
  final String _baseUrl =
      'https://pixabay.com/api/?key=41485709-10bae150ab77c646c4aade16f&image_type=photo';

  Future<PixabaySearchResponse> search(String? query) async {
    String url = query == null ? _baseUrl : '$_baseUrl&q=$query';

    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    return PixabaySearchResponse.fromJson(json);
  }
}
