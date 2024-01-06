import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  final String url;

  const ImageItemWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(url, fit: BoxFit.cover);
  }
}
