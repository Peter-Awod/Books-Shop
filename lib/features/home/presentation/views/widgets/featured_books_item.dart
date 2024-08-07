import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_images.dart';

class FeaturedBooksItem extends StatelessWidget {
  const FeaturedBooksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: AssetImage(
              AssetsImages.testImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
