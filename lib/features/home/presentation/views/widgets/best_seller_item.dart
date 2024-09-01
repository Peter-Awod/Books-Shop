import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/book_model.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20.0),
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: CachedNetworkImage(
                  imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail! ??''
                      // 'https://ehelperteam.com/wp-content/uploads/2019/09/Broken-images.png',
                  ,
                      fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Column(
                    children: [
                      Icon(
                        Icons.error_outline_outlined,
                      ),
                      Text('there is no image to view'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      bookModel.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kHanuman,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo!.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FontAwesomeIcons.solidStar,
                          color: Color(
                            0xffFFDD4F,
                          ),
                        ),
                        const SizedBox(
                          width: 6.3,
                        ),
                        Text(
                          '${bookModel.volumeInfo!.averageRating ?? 0}',
                          style: Styles.textStyle16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '( ${bookModel.volumeInfo!.ratingsCount ?? 0} )',
                          style: Styles.textStyle14.copyWith(
                            color: const Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
