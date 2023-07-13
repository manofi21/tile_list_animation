import 'package:animation_tile_list_practice/locator.dart';
import 'package:animation_tile_list_practice/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'List Animated Card Custom (by Sumit Panwar)'),
    );
  }
}