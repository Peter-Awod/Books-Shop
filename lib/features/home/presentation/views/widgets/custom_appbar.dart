import 'package:books_shop/core/utils/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsImages.logo,
            height: 24,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
        ],
      ),
    );
  }
}
