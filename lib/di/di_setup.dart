import 'package:get_it/get_it.dart';
import 'package:image_search_app_practice/data/repository/image_item_repository.dart';
import 'package:image_search_app_practice/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app_practice/ui/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // repository : singleton
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImple());

  // viewModel : factory
  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(imageItemRepository: getIt<ImageItemRepository>()));
}
