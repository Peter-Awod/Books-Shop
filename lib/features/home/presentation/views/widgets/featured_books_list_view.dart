import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'featured_books_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: ListView.builder(
        padding: const EdgeInsetsDirectional.only(start: 20),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsetsDirectional.only(
            end: 8.0,
          ),
          child: FeaturedBooksItem(),
        ),
      ),
    );
  }
}
