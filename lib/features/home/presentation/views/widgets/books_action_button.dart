import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            text: 'Free',
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              final Uri url = Uri.parse(bookModel.volumeInfo!.previewLink!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            text: 'Preview',
          ),
        ),
      ],
    );
  }
}
