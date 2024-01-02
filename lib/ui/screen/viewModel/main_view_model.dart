import 'dart:async';

import 'package:image_search_app_practice/model/pixabay_image.dart';
import 'package:image_search_app_practice/repository/pixabay_repository.dart';

class MainViewModel {
  List<PixabayImage> _pixabayImageItems = [];

  List<PixabayImage> get pixabayImageItems => List.unmodifiable(_pixabayImageItems);
  final StreamController<bool> _loadingController = StreamController();
  Stream<bool> get isLoadingStream => _loadingController.stream;

  Future searchImages(String? query) async {
    _loadingController.add(true);
    PixabayRepository pixabayRepository = PixabayRepository();

    _pixabayImageItems = await pixabayRepository.searchImage(query);
    _loadingController.add(false);
  }
}
