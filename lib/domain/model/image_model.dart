class ImageModel {
  final String _url;

//<editor-fold desc="Data Methods">
  const ImageModel({
    required String url,
  }) : _url = url;

  String get url => _url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageModel &&
          runtimeType == other.runtimeType &&
          _url == other._url);

  @override
  int get hashCode => _url.hashCode;

  @override
  String toString() {
    return 'ImageModel{' + ' _url: $_url,' + '}';
  }

  ImageModel copyWith({
    String? url,
  }) {
    return ImageModel(
      url: url ?? this._url,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_url': this._url,
    };
  }

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      url: map['_url'] as String,
    );
  }

//</editor-fold>
}
