import 'package:flutter/material.dart';

class IAImage extends StatelessWidget {
  const IAImage({
    super.key,
    required this.imagePath,
    this.size,
  });

  final String imagePath;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      width: size,
      height: size,
      image: NetworkImage(imagePath),
      placeholder: const AssetImage("assets/placeholder.gif"),
      imageErrorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
      fit: BoxFit.fitWidth,
    );
  }
}
