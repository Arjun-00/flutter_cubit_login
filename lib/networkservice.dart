import 'dart:convert';
import 'package:flutter_login_cubit/urls.dart';
import 'package:flutter_login_cubit/userlist/model/userlistmodel.dart';
import 'package:http/http.dart' as http;

class NetworkService{

  Future<bool> doLogin(String email,String password)async{
    var repsonce = await http.post(Uri.parse(Urls.login_API), headers: {
      "Content-Type": "application/json"
    },
    body: json.encode({
      "email" : email,
      "password" : password
    }));

    if(repsonce.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<List<Data>?> fetchUsers() async{
    try{
      var responce = await http.get(Uri.parse(Urls.USER_LIST_API));
      if(responce.statusCode == 200){
        var data = json.decode(responce.body);
        List<Data> userList = UserListModel.fromJson(data).data;
        return userList;
      }else
        {
          throw Exception();
        }
    }
    catch(e){
      return null;
    }
  }
}