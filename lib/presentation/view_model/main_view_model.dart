import 'package:flutter/cupertino.dart';
import 'package:image_search_app_practice/domain/repository/image_repository.dart';
import 'package:image_search_app_practice/presentation/view_model/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final ImageRepository imageRepository;
  final _state = const MainState();

  get state => _state;

  MainViewModel({
    required this.imageRepository,
  });
}
