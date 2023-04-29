import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/screens/detail_page.dart';
import 'package:jacobgoldstonedemo1/screens/home_page.dart';

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
      home:  HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
