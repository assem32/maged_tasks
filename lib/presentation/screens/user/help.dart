import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magedsoft/business_logic/global_cubit/global_cubit.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return  BlocProvider(
      create: (BuildContext context)=>GlobalCubit()..getHelp(),
      child: BlocConsumer<GlobalCubit,GlobalState>(
          listener: (context,state){},
        builder: (context,state){
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
                  child: Column(
                    children: [
                      Text('Help',style: TextStyle(color: Colors.white,fontSize: 30),),
                      Expanded(child: ListView.separated(itemBuilder: (context,index)=>Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.0395348837209302,vertical: height*0.027190332326284),
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
                          child: ExpansionTile(title: Text('${GlobalCubit.get(context).helpList[index]['question']}'),children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: width*0.0348837209302326,vertical: height*0.0080563947633434),
                              child: Text('${GlobalCubit.get(context).helpList[index]['answer']}'),
                            )
                          ],),
                        ),
                      ), separatorBuilder: (context,state)=>SizedBox(height: 20,), itemCount: GlobalCubit.get(context).helpList.length)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.172093023255814,vertical: height*0.027190332326284),
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

                            },child: Text('Continue'),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
        },

      ),
    );
  }
}
