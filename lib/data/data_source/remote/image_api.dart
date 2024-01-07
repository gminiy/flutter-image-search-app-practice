abstract interface class ImageApi {
  Future<Map<String, dynamic>> queryImage(String? query);
}