import 'package:flutter/material.dart';
import 'package:image_search_app_practice/data/model/pixabay_image.dart';

class ImageWidget extends StatelessWidget {
  PixabayImage image;

  ImageWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(
        image.url,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
