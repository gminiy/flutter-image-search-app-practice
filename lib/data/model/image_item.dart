class ImageItem {
  final String url;

//<editor-fold desc="Data Methods">
  const ImageItem({
    required this.url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          url == other.url);

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() {
    return 'ImageItem{' + ' url: $url,' + '}';
  }

  ImageItem copyWith({
    String? url,
  }) {
    return ImageItem(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': this.url,
    };
  }

  factory ImageItem.fromJson(Map<String, dynamic> map) {
    return ImageItem(
      url: map['url'] as String,
    );
  }

//</editor-fold>
}
