part of 'userlist_cubit.dart';

@immutable
abstract class UserlistState {}

class UserlistInitial extends UserlistState {}

class UserlistLoaded extends UserlistState{
  List<Data> userList;

  UserlistLoaded(this.userList);

}