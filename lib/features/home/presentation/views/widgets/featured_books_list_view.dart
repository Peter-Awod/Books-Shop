import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import '../../manager/featured_books_cubit/featured_books_states.dart';
import 'featured_books_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .27,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(start: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                  },
                  child: FeaturedBooksItem(
                    imageUrl: state
                                .books[index].volumeInfo!.imageLinks!.thumbnail !=
                            null
                        ? state.books[index].volumeInfo!.imageLinks!.thumbnail!
                        : 'https://ehelperteam.com/wp-content/uploads/2019/09/Broken-images.png',
                  ),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailureState) {
          return CustomErrorMessage(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLinearLoadingIndicator();
        }
      },
    );
  }
}
