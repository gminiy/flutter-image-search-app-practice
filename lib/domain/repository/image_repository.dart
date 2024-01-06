import 'package:image_search_app_practice/domain/model/image_model.dart';

abstract interface class ImageRepository {
  Future<List<ImageModel>> queryImage(String query);
}