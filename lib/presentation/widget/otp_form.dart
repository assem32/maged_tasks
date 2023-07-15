import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget otpFormFiled({width,height,controller,context})=>Container(
  width:width*0.1627906976744186,
  height: height*0.080563947633434,

  decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 5,
          offset:
          Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)),
  child: TextField(
    controller: controller,
    onChanged: (value){
      if(value.length==1)
        FocusScope.of(context).nextFocus();
    },
    textAlign: TextAlign.center,
    decoration: InputDecoration(
        border: InputBorder.none
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [
      LengthLimitingTextInputFormatter(1),
      FilteringTextInputFormatter.digitsOnly
    ],
  ),
);