import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magedsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:magedsoft/presentation/layout/home_layout.dart';
import 'package:magedsoft/presentation/screens/shared/component.dart';
import 'package:magedsoft/presentation/screens/user/otp.dart';

final _formKey = GlobalKey<FormState>();
var nameController=TextEditingController();
var phoneController=TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){
        if(state is VerifySuccessState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPPage()));
        }
      },
      builder: (context,state){
        return Scaffold(

          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width ,
                    color: Colors.blue,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                    ),
                    width: MediaQuery.of(context).size.width ,

                    height: MediaQuery.of(context).size.height*0.6613076098606645,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.3669587109768379,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.0697674418604651),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                              ),
                              Text('OR'),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.0936555891238671,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 4,
                                      blurRadius: 5,
                                      offset:
                                      Offset(0, 3), // changes position of shadow
                                    )
                                  ]
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                child: Text('F'),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Container(

                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 11),
                                child: Image.asset('assets/images/ios 1.png'),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 4,
                                      blurRadius: 5,
                                      offset:
                                      Offset(0, 3), // changes position of shadow
                                    )
                                  ]
                              ),
                            ),
                            Container(

                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 7),
                                child: Image.asset('assets/images/Google__G__Logo 1.png'),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 4,
                                      blurRadius: 5,
                                      offset:
                                      Offset(0, 3), // changes position of shadow
                                    )
                                  ]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.2471190781049936,
                        ),
                        Container(
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
                              borderRadius: BorderRadius.circular(40)
                          ),
                          width: MediaQuery.of(context).size.width*0.86511627907,
                          height: MediaQuery.of(context).size.height*0.441741357234315,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.0384122919334187,
                                ),
                                Text('Welcome',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.06976744186),),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.0781049935979513,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 45),
                                  child: defaultFormFiled(
                                      label: 'Enter Your Full Name',context: context,controller: nameController,keyboard: TextInputType.name
                                      , validate: (String value) {
                                    if(value.isEmpty)
                                      return 'You have to enter a name';
                                  }
                                  ),
                                ),
                                SizedBox(height:  MediaQuery.of(context).size.height*0.01711983887,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 45),
                                  child: defaultFormFiled(label: 'Enter Your Phone Number',
                                      context: context,
                                      controller: phoneController,
                                      keyboard: TextInputType.phone,
                                      validate: (String value) {
                                        if(value.isEmpty)
                                          return 'You have to enter a name';
                                      }
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.0384122919334187,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 44),
                                  child: defaultButton((){
                                    if(_formKey.currentState!.validate())
                                      GlobalCubit.get(context).login(phoneController.text, nameController.text);
                                  },'Login'),
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
