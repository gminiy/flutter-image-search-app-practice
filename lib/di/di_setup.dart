import 'package:get_it/get_it.dart';
import 'package:image_search_app_practice/data/data_source/remote/image_api.dart';
import 'package:image_search_app_practice/data/data_source/remote/pixabay_api.dart';
import 'package:image_search_app_practice/data/repository/image_repository_impl.dart';
import 'package:image_search_app_practice/domain/repository/image_repository.dart';
import 'package:image_search_app_practice/presentation/view_model/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageApi>(PixabayApi());
  getIt.registerSingleton<ImageRepository>(
    ImageRepositoryImpl(api: getIt<ImageApi>()),
  );
  getIt.registerFactory<MainViewModel>(
    () => MainViewModel(imageRepository: getIt<ImageRepository>()),
  );
}
