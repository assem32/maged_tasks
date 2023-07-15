import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magedsoft/constants/end_points.dart';
import 'package:magedsoft/constants/page_const.dart';
import 'package:magedsoft/data/data_providers/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  void changeIndex(index){
    currentIndex=index;
    if(currentIndex==4){
      emit(HelpPageState());
    }
    if(currentIndex==0){
      emit(LogoutState());
    }
    emit(IndexChangeState());
  }


  var codeCub;
  var phoneCub;
  void login(phone,name){
    DioHelper.postData(url: phoneVerfication, body: {
      'phone':phone,
      'name':name
    }).then((value) {
      phoneCub=phone;
      codeCub=value.data['code'];
      emit(VerifySuccessState());
    }).catchError((error){
      print(error.toString());
      emit(VerifyErrorState());
    });
  }

  void otpVerify(code,phone){
    DioHelper.postData(url: otpVerfication, body: {
      'code':code,
      'phone':phone
    }).then((value) {
      if(codeCub==code){
        emit(VerifyOTPSuccessState());
      }

    }).catchError((error){
      print(error.toString());
      emit(VerifyErrorState());
    });
  }
  
  List product=[];
  void getProduct(){
    DioHelper.getData(url: getProductApi, query: {

    }).then((value) {
      product=value.data['products'];
      emit(GetProductSuccessState());
    });
  }


  List helpList=[];
  void getHelp(){
    DioHelper.getData(url: 'api/getHelp', query: {

    }).then((value) {
      helpList=value.data['help'];
      emit(GetHelpSuccessState());
    });
  }

}
