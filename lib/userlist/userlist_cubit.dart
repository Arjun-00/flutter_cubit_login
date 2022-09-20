import 'package:bloc/bloc.dart';
import 'package:flutter_login_cubit/userlist/model/userlistmodel.dart';
import 'package:meta/meta.dart';

import '../repository.dart';

part 'userlist_state.dart';

class UserlistCubit extends Cubit<UserlistState> {
  final Repository repository;
  UserlistCubit(this.repository) : super(UserlistInitial());

  void fetchUserList(){
    repository.fetchUserList().then((value){
      emit(UserlistLoaded(value!));
    });
  }
}
