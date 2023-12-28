import 'pixabay_image_dto.dart';

class PixabayImageSearchResultDto {
  PixabayImageSearchResultDto({
      this.total, 
      this.totalHits, 
      this.hits,});

  PixabayImageSearchResultDto.fromJson(dynamic json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = [];
      json['hits'].forEach((v) {
        hits?.add(PixabayImageDto.fromJson(v));
      });
    }
  }
  int? total;
  int? totalHits;
  List<PixabayImageDto>? hits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['totalHits'] = totalHits;
    if (hits != null) {
      map['hits'] = hits?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}