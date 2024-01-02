class PixabayImage {
  final String url;

//<editor-fold desc="Data Methods">
  const PixabayImage({
    required this.url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PixabayImage &&
          runtimeType == other.runtimeType &&
          url == other.url);

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() {
    return 'PixabayImage{' + ' url: $url,' + '}';
  }

  PixabayImage copyWith({
    String? url,
  }) {
    return PixabayImage(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': this.url,
    };
  }

  factory PixabayImage.fromJson(Map<String, dynamic> map) {
    return PixabayImage(
      url: map['url'] as String,
    );
  }

//</editor-fold>
}