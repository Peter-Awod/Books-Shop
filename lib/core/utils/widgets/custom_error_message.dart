
import 'package:flutter/material.dart';

import '../styles.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Text(
        errorMessage,
        style: Styles.textStyle16,
      ),
    );
  }
}