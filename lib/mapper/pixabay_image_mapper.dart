import 'package:image_search_app_practice/dto/pixabay_image_search_result_dto.dart';
import 'package:image_search_app_practice/model/pixabay_image.dart';

extension PixabayImageMapper on PixabayImageSearchResultDto {
  List<PixabayImage> toPixabayImageList() {
    if (hits == null) {
      return [];
    }

    return hits!
        .map((e) => PixabayImage(
            imageUrl: e.previewURL ??
                'https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg'))
        .toList();
  }
}
