import 'package:flutter/material.dart';
import 'package:sample_animations/home_screen.dart';
import 'package:sample_animations/tween_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TweenScreen(),
    );
  }
}
