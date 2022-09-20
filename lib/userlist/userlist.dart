import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_cubit/userlist/userlist_cubit.dart';

import 'model/userlistmodel.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('USER LIST'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.deepOrange,
        child: BlocBuilder<UserlistCubit,UserlistState>(
          builder: (context, state){
            if(!(state is UserlistLoaded)){
              return Center(child: CircularProgressIndicator());
            }
            else{
              final userList = state.userList;
              return _userslist(userList);
            }
          },
        ),
      ),
    );
  }

  Widget _userslist(List<Data> userList){
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              width: double.infinity,
              height: 92,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      //mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:NetworkImage(userList[index].avatar) ,),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child:  Text(userList[index].firstName+" "+userList[index].lastName,
                                  style: TextStyle(fontSize: 19),),
                              ),
                              SizedBox(height: 3,),
                              Text(userList[index].email)
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
            onTap: (){
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Dialog Title'),
                    content: Text(userList[index].email),
                  )
              );
            },
          );
        });
  }
}
