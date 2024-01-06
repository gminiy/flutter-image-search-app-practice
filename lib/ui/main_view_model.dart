import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search_app_practice/data/repository/image_item_repository.dart';
import 'package:image_search_app_practice/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _imageItemRepository;
  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepository imageItemRepository,
  }) : _imageItemRepository = imageItemRepository;

  Future searchImage(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    _state = _state.copyWith(
        isLoading: false,
        imageItems: await _imageItemRepository.getImageItems(query));
    notifyListeners();
  }
}
