import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

Widget chooseCategory({width,text,icon})=>Container(
    width: width*0.3,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [Icon(icon),
          SizedBox(
            width: width*0.0302325581395349,
          ),
          Text('$text'),
        ],
      ),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
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