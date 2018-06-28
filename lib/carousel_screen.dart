import 'package:flutter/material.dart';
import 'package:carousel_cards/carousel_body.dart';

class CarouselScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new SizedBox(
              height: 250.0,
               child: new CarouselBody(),
          )
        ],
      ),
    );
  }
}