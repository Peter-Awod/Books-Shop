import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/custom_error_message.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';
import '../../manager/similar_books_cubit/similar_books_states.dart';
import 'featured_books_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(start: 20),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 8.0,
                ),
                child: FeaturedBooksItem( imageUrl: 'https://ehelperteam.com/wp-content/uploads/2019/09/Broken-images.png',),
              ),
            ),
          );
        } else if (state is SimilarBooksFailureState) {
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
