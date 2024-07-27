import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AssetsImages.logo,
          ),
          const Text(
            'Read Free Books',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
