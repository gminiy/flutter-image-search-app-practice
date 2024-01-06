import 'package:image_search_app_practice/data/model/image_item.dart';
import 'package:image_search_app_practice/data/repository/image_item_repository.dart';

class MockImageItemRepositoryImpl implements ImageItemRepository {
  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == 'apple') {
      return [
        const ImageItem(
            url:
                "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg"),
        const ImageItem(
            url:
                "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg"),
        const ImageItem(
            url:
                "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg"),
      ];
    } else {
      return [
        const ImageItem(
            url:
                "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg")
      ];
    }
  }
}
