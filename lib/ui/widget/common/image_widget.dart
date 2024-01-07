import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String _url;

  const ImageWidget({
    required String url,
  }) : _url = url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(_url, fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
