import 'package:image_search_app_practice/data/data_source/pixabay_api.dart';
import 'package:image_search_app_practice/data/model/image_item.dart';
import 'package:image_search_app_practice/data/mapper/image_mapper.dart';
import 'package:image_search_app_practice/data/repository/image_item_repository.dart';

class ImageItemRepositoryImple implements ImageItemRepository{
  final _api = PixabayApi();

  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImageResult(query);

    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}
