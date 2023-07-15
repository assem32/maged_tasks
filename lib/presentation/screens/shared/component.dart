// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// Widget defaultFormFiled({label,context,controller,keyboard,Function(String)? validate})=>Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset: Offset(0, 3), // changes the position of the shadow
//                               ),
//                             ],
//                           ),
//                           child: TextFormField(
//                             validator: (v){
//                               return validate!(v!);
//                             },
//                             keyboardType: keyboard,
//                             controller: controller,
//                             decoration: InputDecoration(
//                               fillColor: Colors.white,
//                               filled: true,
//                               border: InputBorder.none,
//                               labelText: '$label',
//                               labelStyle: TextStyle(fontSize: 10),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.transparent),
//                                 borderRadius: BorderRadius.circular(20.0),
//                               ),
//                             ),
//                           ),
//                         );
//
// Widget chooseCategory({width,text,path,selected})=>Container(
//     width: width*0.3,
//     child: Padding(
//       padding:  EdgeInsets.all(width*0.013953488372093),
//       child: Row(
//         children: [Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(50),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3), // changes the position of the shadow
//                 ),
//               ]
//           ),
//             child: Padding(
//               padding:  EdgeInsets.all(width*0.013953488372093),
//               child: Image.asset( '$path',width: width*0.0651162790697674,height:width*0.0651162790697674),
//             )
//         ),
//           SizedBox(
//             width: width*0.0302325581395349,
//           ),
//           Text('$text',style: TextStyle(color: selected==true?Colors.white:Colors.black),),
//         ],
//       ),
//     ),
//     decoration: BoxDecoration(
//       color: selected==true?Color(0xff0062BD):Colors.white,
//       borderRadius: BorderRadius.circular(25),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 2,
//           blurRadius: 5,
//           offset:
//           Offset(0, 3), // changes the position of the shadow
//         ),
//       ],
//     )
// );
//
//
// Widget otpFormFiled({width,height,controller,context})=>Container(
//   width:width*0.1627906976744186,
//   height: height*0.080563947633434,
//
//   decoration: BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.3),
//           spreadRadius: 4,
//           blurRadius: 5,
//           offset:
//           Offset(0, 3), // changes position of shadow
//         ),
//       ],
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15)),
//   child: TextField(
//     controller: controller,
//     onChanged: (value){
//       if(value.length==1)
//         FocusScope.of(context).nextFocus();
//     },
//     textAlign: TextAlign.center,
//     decoration: InputDecoration(
//       border: InputBorder.none
//     ),
//     keyboardType: TextInputType.number,
//     inputFormatters: [
//       LengthLimitingTextInputFormatter(1),
//       FilteringTextInputFormatter.digitsOnly
//     ],
//   ),
// );
//
// Widget defaultButton(function,text)=>Container(
//
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(50),
//       gradient: LinearGradient(
//         colors: [Color(0xff0062BD), Color(0xff0062BD).withOpacity(0.5),Color(0xff0062BD).withOpacity(0.25)],
//         begin: Alignment.centerLeft,
//         end: Alignment.centerRight,
//       )
//   ),
//   child: MaterialButton(
//
//     minWidth: double.infinity,
//     onPressed: (){
//       function();
//     },child: Text('$text',style: TextStyle(color: Colors.white),),),
// );