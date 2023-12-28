class PixabayImage {
  String imageUrl;

//<editor-fold desc="Data Methods">
  PixabayImage({
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PixabayImage &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => imageUrl.hashCode;

  @override
  String toString() {
    return 'PixabayImage{' + ' imageUrl: $imageUrl,' + '}';
  }

  PixabayImage copyWith({
    String? imageUrl,
  }) {
    return PixabayImage(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
    };
  }

  factory PixabayImage.fromJson(Map<String, dynamic> map) {
    return PixabayImage(
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}
