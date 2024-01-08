import 'package:image_search_app_practice/domain/model/image_model.dart';
import 'package:image_search_app_practice/domain/repository/image_repository.dart';
import 'package:image_search_app_practice/domain/result/result.dart';

class QueryImageUseCase {
  final ImageRepository _imageRepository;

  const QueryImageUseCase({
    required ImageRepository imageRepository,
  }) : _imageRepository = imageRepository;

  Future<Result<List<ImageModel>>> execute(String query) async {
    try {
      final images = await _imageRepository.queryImage(query);

      return Result.success(images);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
