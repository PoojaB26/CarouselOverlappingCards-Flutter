import 'package:flutter/material.dart';
import 'package:carousel_cards/carousel_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarouselScreen(),
    );
  }
}

