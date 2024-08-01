import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: FeaturedBooksListView(),
        ),
      ],
    );
  }
}

