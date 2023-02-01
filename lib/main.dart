import 'package:flutter/material.dart';
import 'package:food/views/splash_screen.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: SplashPage(), debugShowCheckedModeBanner: false);
  }
}
