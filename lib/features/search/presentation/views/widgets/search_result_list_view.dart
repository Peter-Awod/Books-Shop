import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/best_seller_item.dart';
import '../../manage/search_cubit/search_cubit.dart';
import '../../manage/search_cubit/search_states.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchInitialState) {
          return const Text('');
        } else if (state is SearchSuccessState) {
          return Column(
            children: [
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
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: state.books[index]);
                        },
                        child: BestSellerItem(
                          bookModel: state.books[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SearchFailureState) {
          return CustomErrorMessage(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomCircularLoadingIndicator();
        }
      },
    );

    // return ListView.builder(
    //   physics: const BouncingScrollPhysics(),
    //   padding: EdgeInsets.zero,
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return Padding(
    //       padding: const EdgeInsetsDirectional.symmetric(
    //         vertical: 8,
    //       ),
    //       child: GestureDetector(
    //         // onTap: () {
    //         //   GoRouter.of(context).push(AppRouter.kBookDetailsView);
    //         // },
    //         child: const Text('BestSellerItem'),
    //       //  child: const BestSellerItem(),
    //       ),
    //     );
    //   },
    // );
  }
}
