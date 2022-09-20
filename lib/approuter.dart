
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_cubit/login/login.dart';
import 'package:flutter_login_cubit/login/login_cubit.dart';
import 'package:flutter_login_cubit/networkservice.dart';
import 'package:flutter_login_cubit/repository.dart';
import 'package:flutter_login_cubit/settings.dart';
import 'package:flutter_login_cubit/userlist/userlist.dart';
import 'package:flutter_login_cubit/userlist/userlist_cubit.dart';

class AppRouter{
  late Repository repository;
  AppRouter(){
    repository = Repository(NetworkService());
  }

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){

      case "/" :
        return MaterialPageRoute(builder: (_) =>
        BlocProvider(create: (BuildContext context) => LoginCubit(Repository(NetworkService())),
        child: Login(),
        )
        );

      case USER_LIST :
        return MaterialPageRoute(builder: (_) =>
        BlocProvider(
          create: (BuildContext context) => UserlistCubit(Repository(NetworkService())),
          child: UserList(),
        )
        );

      default :
        return null;
    }
  }
}