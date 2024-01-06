import 'package:image_search_app_practice/data/model/image_item.dart';

abstract interface class ImageItemRepository {
Future<List<ImageItem>> getImageItems(String query);
}