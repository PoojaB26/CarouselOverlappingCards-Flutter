import 'package:flutter/material.dart';
import 'package:carousel_effect/carousel_body.dart';

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new SizedBox(
              height: 200.0,
               child: new CarouselBody(),
          )
        ],
      ),
    );
  }
}