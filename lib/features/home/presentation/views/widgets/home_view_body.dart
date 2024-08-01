import 'package:books_shop/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'custom_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        CustomListView(),
      ],
    );
  }
}

