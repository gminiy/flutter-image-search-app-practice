import 'package:flutter/material.dart';

class PixabayImage extends StatelessWidget {
  final String _url;

  const PixabayImage({
    super.key,
    required String url,
  }) : _url = url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(_url, fit: BoxFit.cover),
    );
  }
}
