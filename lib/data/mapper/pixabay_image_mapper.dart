import 'package:image_search_app_practice/data/dto/pixabay_query_response.dart';
import 'package:image_search_app_practice/data/model/pixabay_image.dart';

extension PixabayImageMapper on PixabayQueryResponse {
  List<PixabayImage> toPixabayImage() {
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
