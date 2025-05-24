import 'package:flutter/material.dart';

// Reusable network image widget with error and loading states
class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxShape shape;
  final double borderRadius;
  final Color backgroundColor;
  final BoxFit fit;
  final double errorIconSize;
  final Color errorIconColor;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.shape = BoxShape.rectangle,
    this.borderRadius = 0,
    this.backgroundColor = Colors.grey,
    this.fit = BoxFit.cover,
    this.errorIconSize = 30,
    this.errorIconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(borderRadius)
            : null,
        shape: shape,
      ),
      child: buildImageContent(),
    );
  }

  Widget buildImageContent() {
    if (imageUrl.isEmpty) {
      return buildErrorImage();
    }

    return ClipRRect(
      borderRadius: shape == BoxShape.circle
          ? BorderRadius.circular(500)
          : BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => buildErrorImage(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget buildErrorImage() {
    return Center(
      child: Icon(
        Icons.image_not_supported,
        color: errorIconColor,
        size: errorIconSize,
      ),
    );
  }
}
