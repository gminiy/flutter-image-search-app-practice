import 'dart:convert';
import 'package:image_search_app_practice/dto/pixabay_image_search_result_dto.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final String _baseUrl =
      'https://pixabay.com/api/?key=41485709-10bae150ab77c646c4aade16f&image_type=photo';

  Future<PixabayImageSearchResultDto> searchImages(String query) async {
    final String url = '$_baseUrl&q=$query';
    final response = await http.get(Uri.parse(url));
    final  json = jsonDecode(response.body);

    return PixabayImageSearchResultDto.fromJson(json);
  }
}
