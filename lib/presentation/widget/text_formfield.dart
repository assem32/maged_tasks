import 'package:flutter/material.dart';

Widget defaultFormFiled({label,context,controller,keyboard,Function(String)? validate})=>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes the position of the shadow
      ),
    ],
  ),
  child: TextFormField(
    validator: (v){
      return validate!(v!);
    },
    keyboardType: keyboard,
    controller: controller,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: InputBorder.none,
      labelText: '$label',
      labelStyle: TextStyle(fontSize: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  ),
);