import 'package:flutter/cupertino.dart';
import 'package:image_search_app_practice/domain/use_case/query_image_use_case.dart';
import 'package:image_search_app_practice/presentation/view_model/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final QueryImageUseCase _queryImageUseCase;
  MainState _state = const MainState();

  get state => _state;

  MainViewModel({
    required QueryImageUseCase queryImageUseCase,
  }) : _queryImageUseCase = queryImageUseCase;

  Future queryImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final images = await _queryImageUseCase.execute(query);
    _state = state.copyWith(isLoading: false, images: images);
    notifyListeners();
  }
}
