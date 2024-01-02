import 'package:flutter/cupertino.dart';
import 'package:image_search_app_practice/data/model/pixabay_image.dart';
import 'package:image_search_app_practice/data/repository/pixabay_image_repository.dart';

class MainViewModel {
  final TextEditingController textEditingController = TextEditingController() ;
  final List<PixabayImage> images = [];
  final PixabayImageRepository pixabayImageRepository = PixabayImageRepository();

  Future queryImages() async {
    return await pixabayImageRepository.queryImages(_textEditingController.text);
  }



}