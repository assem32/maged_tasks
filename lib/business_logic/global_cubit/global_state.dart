part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class IndexChangeState extends GlobalState {}

class HelpPageState extends GlobalState {}

class LogoutState extends GlobalState {}

class VerifySuccessState extends GlobalState {}

class VerifyErrorState extends GlobalState {}

class VerifyOTPSuccessState extends GlobalState {}

class VerifyOTPErrorState extends GlobalState {}

class GetProductSuccessState extends GlobalState {}

class GetHelpSuccessState extends GlobalState {}
