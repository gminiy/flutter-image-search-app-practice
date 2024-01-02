import 'package:flutter/cupertino.dart';
import 'package:image_search_app_practice/data/model/pixabay_image.dart';
import 'package:image_search_app_practice/data/repository/pixabay_image_repository.dart';

class MainViewModel {
  List<PixabayImage> images = [];
  final PixabayImageRepository pixabayImageRepository =
      PixabayImageRepository();

  Future queryImages(String query) async {
    images = await pixabayImageRepository.queryImages(query);
  }
}
