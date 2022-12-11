import 'package:flutter/material.dart';
import 'package:task01/views/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task01',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
