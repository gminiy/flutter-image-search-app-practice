import 'package:image_search_app_practice/data/dto/pixabay_image_query_dto.dart';
import 'package:image_search_app_practice/domain/model/image_model.dart';

extension PixabayHitMapper on Hit {
  ImageModel toImage() {
    return ImageModel(
      url: previewURL ??
          'https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg',
    );
  }
}
