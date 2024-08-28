import 'package:flutter/material.dart';

class CustomLinearLoadingIndicator extends StatelessWidget {
  const CustomLinearLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LinearProgressIndicator(),
    );
  }
}

class CustomCircularLoadingIndicator extends StatelessWidget {
  const CustomCircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
