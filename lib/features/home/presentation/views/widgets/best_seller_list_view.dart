import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../manager/best_seller_books_cubit/best_seller_books_cubit.dart';
import '../../manager/best_seller_books_cubit/best_seller_books_states.dart';
import 'best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksStates>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 8,
                ),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                  },
                  child: BestSellerItem(
                    bookModel: state.books[index],
                  ),
                ),
              );
            },
          );
        } else if (state is BestSellerBooksFailureState) {
          return CustomErrorMessage(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomCircularLoadingIndicator();
        }
      },
    );
  }
}
