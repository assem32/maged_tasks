import 'package:flutter/material.dart';
import 'package:magedsoft/presentation/styles/colors.dart';

Widget defaultButton(function,text)=>Container(

  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      gradient: LinearGradient(
        colors: [AppColor.blue,AppColor.blue.withOpacity(0.5),AppColor.blue.withOpacity(0.25)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )
  ),
  child: MaterialButton(

    minWidth: double.infinity,
    onPressed: (){
      function();
    },child: Text('$text',style: TextStyle(color: Colors.white),),),
);