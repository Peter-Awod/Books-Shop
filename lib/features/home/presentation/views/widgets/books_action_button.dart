import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/custom_button.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key});

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
            text: '19.99 €',
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {},
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            text: 'Free Preview',
          ),
        ),
      ],
    );
  }
}
