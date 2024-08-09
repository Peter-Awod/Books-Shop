import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 40.0,
        start: 20,
        end: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle20.copyWith(
              fontFamily: kHanuman,
              color: Colors.white54,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: SearchResultListView(),)
        ],
      ),
    );
  }
}
