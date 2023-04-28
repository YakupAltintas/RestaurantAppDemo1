import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/screans/detail_page.dart';
import 'package:jacobgoldstonedemo1/screans/home_page.dart';
import 'Provider/provider_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uplabs demo1',
      theme: ThemeData(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
