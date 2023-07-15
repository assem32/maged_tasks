import 'package:flutter/material.dart';

Widget cardView({width,height,networkImage})=>Container(
  width: width*0.2325581395348837,
  height: height*0.1007049345417925,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes the position of the shadow
      ),
    ],
  ),
  child: Padding(
    padding: EdgeInsets.symmetric(vertical: height*0.0231621349446123,horizontal:width*0.0325581395348837 ),
    child: Image(
        image: NetworkImage(
            "$networkImage")),
  ),
);