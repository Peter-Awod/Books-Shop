import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';
import 'books_action_button.dart';
import 'featured_books_item.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: width * 0.25),
                child: FeaturedBooksItem(
                    imageUrl:
                        bookModel.volumeInfo!.imageLinks?.thumbnail ?? ''),
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                bookModel.volumeInfo!.title!,
                style: Styles.textStyle30,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                bookModel.volumeInfo!.authors![0],
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 12,
              ),
              // Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.solidStar,
                    color: Color(
                      0xffFFDD4F,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${bookModel.volumeInfo!.averageRating ?? 0}',
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '( ${bookModel.volumeInfo!.ratingsCount ?? 0} )',
                    style: Styles.textStyle14.copyWith(
                      color: const Color(0xff707070),
                    ),
                  ),
                ],
              ),
              // Action button
              const SizedBox(
                height: 44,
              ),
               BooksActionButton(bookModel: bookModel,),
              const Expanded(
                child: SizedBox(
                  height: 44,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'You may also like',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              const SimilarBooksListView(),
            ],
          ),
        )
      ],
    );
  }
}
