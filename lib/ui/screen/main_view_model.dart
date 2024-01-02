import 'package:flutter/material.dart';
import 'package:image_search_app_practice/data/model/pixabay_image.dart';
import 'package:image_search_app_practice/data/repository/pixabay_image_repository.dart';

class MainViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<PixabayImage> images = [];
  final PixabayImageRepository pixabayImageRepository =
      PixabayImageRepository();

  Future queryImages(String query) async {
    isLoading = true;
    notifyListeners();
    images = await pixabayImageRepository.queryImages(query);
    isLoading = false;
    notifyListeners();
  }
}
