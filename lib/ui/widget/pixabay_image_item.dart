import 'package:flutter/material.dart';

class PixabayImageItem extends StatelessWidget {
  final String _url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16), child: Image.network(_url, fit: BoxFit.cover));
  }

  const PixabayImageItem({
    required String url,
  }) : _url = url;
}
