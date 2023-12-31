import 'package:image_search_app_practice/api/pixabay_api.dart';
import 'package:image_search_app_practice/dto/pixabay_search_response.dart';
import 'package:image_search_app_practice/model/pixabay_image.dart';
import 'package:image_search_app_practice/mapper/pixabay_search_response_to_image_mapper.dart';
class PixabayRepository {
  final PixabayAPi  api = PixabayAPi();

  Future<List<PixabayImage>> searchImage(String? query) async {
    final PixabaySearchResponse pixabaySearchResponse = await api.search(query);

    return pixabaySearchResponse.toImage();
  }
}