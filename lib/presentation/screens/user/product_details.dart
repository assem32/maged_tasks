import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.networkImage,required this.text,required this.company,required this.price,required this.name,required this.type });
  final networkImage;
  final text;
  final company;
  final price;
  final name;
  final type;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0062BD).withOpacity(0.85), Colors.white],
            // Set your desired gradient colors
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                Text('$name',style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.0581395348837209),),
                Text('$type',style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.0348837209302326)),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*0.0767441860465116),
                  child: Container(
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
                      padding: EdgeInsets.all(height*0.040281973816717),
                      child: Image(
                          image: NetworkImage(
                              "$networkImage")),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*0.0651162790697674),
                  child: Container(
                    width: double.infinity,
                    height: height*0.1107754279959718,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=> Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                          ),
                        ), separatorBuilder: (context,index)=>SizedBox(
                      width: width*0.0325581395348837,
                    ), itemCount: 4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.0767441860465116),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(
                                    0, 3), // changes the position of the shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width*0.039534883720930),
                            child: Row(
                              children: [

                                Text('$company'),
                                Spacer(),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(
                                              0, 3), // changes the position of the shadow
                                        ),
                                      ],
                                    ),
                                    child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)))
                              ],
                            ),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.0342396777442095,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*0.0767441860465116 ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price',style: TextStyle(color: Colors.grey),),
                          Text('$price'),
                        ],
                      ),
                      Spacer(),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [Color(0xff0062BD), Color(0xff0062BD).withOpacity(0.5),Color(0xff0062BD).withOpacity(0.25)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                          ),
                          child: MaterialButton(

                            minWidth: double.infinity,
                            onPressed: (){

                            },child: Text('Add To Cart'),),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.0342396777442095,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.0767441860465116 ),
                  child: Text('$text',style: TextStyle(color: Colors.grey),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
