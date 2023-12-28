import 'package:image_search_app_practice/api/pixabay_api.dart';
import 'package:image_search_app_practice/dto/pixabay_image_search_result_dto.dart';
import 'package:image_search_app_practice/model/pixabay_image.dart';
import 'package:image_search_app_practice/mapper/pixabay_image_mapper.dart';

class PixabayImageRepository {
  Future<List<PixabayImage>> searchImages(String query) async {
    final PixabayApi api = PixabayApi();
    final PixabayImageSearchResultDto pixabayImageSearchResultDto =
        await api.searchImages(query);
    return pixabayImageSearchResultDto.toPixabayImageList();
  }
}
