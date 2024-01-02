import 'package:image_search_app_practice/data/api/pixabay_api.dart';
import 'package:image_search_app_practice/data/dto/pixabay_query_response.dart';
import 'package:image_search_app_practice/data/model/pixabay_image.dart';
import 'package:image_search_app_practice/data/mapper/pixabay_image_mapper.dart';

class PixabayImageRepository {
  final PixabayApi _api = PixabayApi();

  Future<List<PixabayImage>> queryImages(String query) async {
    final PixabayQueryResponse response = await _api.queryImages(query);

    return response.toPixabayImage();
  }
}
