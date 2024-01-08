import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_search_app_practice/domain/model/image_model.dart';
import 'package:image_search_app_practice/domain/result/result.dart';
import 'package:image_search_app_practice/domain/use_case/query_image_use_case.dart';
import 'package:image_search_app_practice/presentation/view_model/main_event.dart';
import 'package:image_search_app_practice/presentation/view_model/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final QueryImageUseCase _queryImageUseCase;
  MainState _state = const MainState();

  get state => _state;

  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventStream => _eventController.stream;

  MainViewModel({
    required QueryImageUseCase queryImageUseCase,
  }) : _queryImageUseCase = queryImageUseCase;

  Future queryImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _queryImageUseCase.execute(query);
    switch(result) {
      case Success<List<ImageModel>>():
        _state = state.copyWith(isLoading: false, images: result.data);
        notifyListeners();
      case Error<List<ImageModel>>():
        final List<ImageModel> empty = [];
        _state = state.copyWith(isLoading: false, images: empty);
        _eventController.add(const MainEvent.dataLoadingError());
        notifyListeners();
    }
  }
}
