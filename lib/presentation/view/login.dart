import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magedsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:magedsoft/constants/page_const.dart';
import 'package:magedsoft/presentation/layout/home_layout.dart';
import 'package:magedsoft/presentation/screens/shared/component.dart';
import 'package:magedsoft/presentation/styles/assets_manger.dart';
import 'package:magedsoft/presentation/styles/colors.dart';
import 'package:magedsoft/presentation/view/otp.dart';
import 'package:magedsoft/presentation/widget/button.dart';
import 'package:magedsoft/presentation/widget/text_formfield.dart';
import 'package:magedsoft/presentation/widget/toast.dart';

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
          showToast('your otp is ${state.otpCode}',context);
          Navigator.pushNamed(context, otp);
        }
      },
      builder: (context,state){
        return Scaffold(

          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Image.asset(AssetsManger.background,fit: BoxFit.fitHeight),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width ,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ],
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
                                  color: AppColor.lightBlue,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text('OR',style: TextStyle(color: AppColor.lightBlue),),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: AppColor.lightBlue,
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
                                  height: MediaQuery.of(context).size.height*0.0151057401812689,
                                ),
                                Container(
                                  color: Color(0xff0062BD).withOpacity(0.72),
                                  width: MediaQuery.of(context).size.width*0.3325581395348837,
                                  height: MediaQuery.of(context).size.height*0.0030211480362538,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.040281973816717,
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
