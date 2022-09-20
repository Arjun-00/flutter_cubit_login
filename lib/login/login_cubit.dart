import 'package:bloc/bloc.dart';
import 'package:flutter_login_cubit/repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;
  LoginCubit(this.repository) : super(LoginInitial());

  void doLogin(String email, String password){
    if(email == ""){
      emit(LoginError("Enter email"));
    }else if(password == ""){
      emit(LoginError("Enter Password"));
    } else{
      emit(LoginProcessing());
      repository.doLogin(email, password).then((value) {
        if(value){
          emit(LoginSucess());
        }else{
          emit(LoginError("Invalid Credentials"));
        }
      });
    }
  }

}
