import 'package:image_search_app_practice/dto/pixabay_search_response.dart';
import 'package:image_search_app_practice/model/pixabay_image.dart';

extension PixabaySearchResponseToImageMapper on PixabaySearchResponse {
  List<PixabayImage> toImage() {
    if (hits == null) {
      return [];
    }
    return hits!
        .map((hit) => PixabayImage(
              url: hit.previewURL ??
                  'https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg',
            ))
        .toList();
  }
}
