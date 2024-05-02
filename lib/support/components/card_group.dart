import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardGroup extends StatelessWidget {
  final String path;
  final VoidCallback onTap;

  const CardGroup({super.key, required this.path, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image(
        image: CachedNetworkImageProvider(path),
        height: 120,
        width: 120,
      ),
    );
  }
}
