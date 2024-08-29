import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentation/views/widgets/best_seller_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 8,
          ),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kBookDetailsView);
            },
            child: const Text('BestSellerItem'),
          //  child: const BestSellerItem(),
          ),
        );
      },
    );
  }
}
