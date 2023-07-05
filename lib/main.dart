// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:textfield/splash_screen/splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplsahPage(),
    );
  }
}
