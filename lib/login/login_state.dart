part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginError extends LoginState{
  final String error;
  LoginError(this.error);
}

class LoginProcessing extends LoginState{

}

class LoginSucess extends LoginState{

}
