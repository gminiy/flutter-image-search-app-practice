import 'package:image_search_app_practice/domain/model/image_model.dart';
import 'package:image_search_app_practice/domain/repository/image_repository.dart';

class QueryImageUseCase {
  final ImageRepository _imageRepository;

  const QueryImageUseCase({
    required ImageRepository imageRepository,
  }) : _imageRepository = imageRepository;

  Future<List<ImageModel>> execute(String query) {
    return _imageRepository.queryImage(query);
  }
}
