import 'package:flutter/material.dart';

final category = new Row(
  children: <Widget>[
    Container(
      width: 3.0,
      height: 12.0,
      color: Colors.redAccent,
    ),
    SizedBox(width: 10.0,),
    new Text("International Offer",
    style: new TextStyle(fontSize: 11.0),
    )
  ],
);

final titleStyle = new TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontWeight: FontWeight.w700
);
final title = new Container(
  padding: new EdgeInsets.only(left: 15.0),
  child: new Text("Introducing myBiz", style: titleStyle,),
);

final subTitleStyle = new TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w300
);
final subTitle = new Container(
  padding: new EdgeInsets.only(left: 15.0, right: 15.0),
  child: new Text("A smart corporate tool for business travelers. \n Flat 10,000 benefits on for First Booking", style: subTitleStyle,
  maxLines: 3,),
);