import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magedsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:magedsoft/presentation/layout/home_layout.dart';
import 'package:magedsoft/presentation/screens/shared/component.dart';
import 'package:magedsoft/presentation/widget/button.dart';
import 'package:magedsoft/presentation/widget/otp_form.dart';
import 'package:magedsoft/presentation/widget/toast.dart';

var first=TextEditingController();
var seconed=TextEditingController();
var third=TextEditingController();
var fourth=TextEditingController();

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){
        if(state is VerifyOTPSuccessState){
          showToast('Account Verified', context);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeLayout()), (route) => false);
        }
      },
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
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.0624370594159114,
                  ),
                  Text('Verify Phone',style: TextStyle(color: Colors.white,fontSize: width*0.0697674418604651),),
                  SizedBox(
                    height: height*0.1389728096676737,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      otpFormFiled(controller: first,width: width,height: height,context:context ),
                      otpFormFiled(controller: seconed,width: width,height: height,context:context ),
                      otpFormFiled(controller: third,width: width,height: height,context:context ),
                      otpFormFiled(controller: fourth,width: width,height: height,context:context ),
                    ],
                  ),
                  Spacer(),
                  TextButton(onPressed: (){}, child: Text('Resend Code')),
                  Padding(padding: EdgeInsets.symmetric(horizontal: width*0.1023255813953488),
                    child: defaultButton((){
                      GlobalCubit.get(context).otpVerify(first.text+seconed.text+third.text+fourth.text, GlobalCubit.get(context).phoneCub);
                    }, 'Verify'),),
                  SizedBox(
                    height: height*0.0916414904330312,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
