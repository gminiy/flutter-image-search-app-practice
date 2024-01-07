// url: "https://pixabay.com/api/?key=41485709-10bae150ab77c646c4aade16f&image_type=photo"
import 'package:flutter/material.dart';
import 'package:image_search_app_practice/di/di_setup.dart';
import 'package:image_search_app_practice/router.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}