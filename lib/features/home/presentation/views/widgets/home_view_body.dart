import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_images.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_appbar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(
        start: 20,
        top: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 48,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
          SizedBox(height: 20,),
          BestSellerItem(),
        ],
      ),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(
                    AssetsImages.testImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          const Column(children: [],)
        ],
      ),
    );
  }
}
