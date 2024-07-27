import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooksShop());
}

class BooksShop extends StatelessWidget {
  const BooksShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books Shop',
      // theme: ThemeData(
      //
      //   scaffoldBackgroundColor: kPrimaryColor,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home:const SplashView(),
    );
  }
}


