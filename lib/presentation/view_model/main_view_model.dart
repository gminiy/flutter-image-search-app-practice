import 'package:image_search_app_practice/domain/repository/image_repository.dart';
import 'package:image_search_app_practice/presentation/view_model/main_state.dart';

class MainViewModel {
  final ImageRepository imageRepository;
  final _state = const MainState();

  get state => _state;

  const MainViewModel({
    required this.imageRepository,
  });
}