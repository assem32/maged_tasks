import 'package:flutter/material.dart';

Widget chooseCategory({width,text,path,selected})=>Container(
    width: width*0.3,
    child: Padding(
      padding:  EdgeInsets.all(width*0.013953488372093),
      child: Row(
        children: [Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes the position of the shadow
                  ),
                ]
            ),
            child: Padding(
              padding:  EdgeInsets.all(width*0.013953488372093),
              child: Image.asset( '$path',width: width*0.0651162790697674,height:width*0.0651162790697674),
            )
        ),
          SizedBox(
            width: width*0.0302325581395349,
          ),
          Text('$text',style: TextStyle(color: selected==true?Colors.white:Colors.black),),
        ],
      ),
    ),
    decoration: BoxDecoration(
      color: selected==true?Color(0xff0062BD):Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset:
          Offset(0, 3), // changes the position of the shadow
        ),
      ],
    )
);