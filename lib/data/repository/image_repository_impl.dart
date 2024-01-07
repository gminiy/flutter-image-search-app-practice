import 'package:image_search_app_practice/data/data_source/remote/image_api.dart';
import 'package:image_search_app_practice/data/dto/pixabay_image_query_dto.dart';
import 'package:image_search_app_practice/domain/model/image_model.dart';
import 'package:image_search_app_practice/domain/repository/image_repository.dart';
import 'package:image_search_app_practice/data/mapper/pixabay_hit_mapper.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageApi _api;

  ImageRepositoryImpl({
    required ImageApi api,
  }) : _api = api;

  @override
  Future<List<ImageModel>> queryImage(String? query) async {
    final responseBodyJson = await _api.queryImage(query);
    final PixabayImageQueryDto dto =
        PixabayImageQueryDto.fromJson(responseBodyJson);

    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((hit) => hit.toImage()).toList();
  }
}