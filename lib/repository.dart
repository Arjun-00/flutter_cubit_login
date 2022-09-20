
import 'package:flutter_login_cubit/networkservice.dart';
import 'package:flutter_login_cubit/userlist/model/userlistmodel.dart';

class Repository{
  final NetworkService networkService;
  Repository(this.networkService);

  Future<bool> doLogin(String email,String password) async{
    final islogins = await networkService.doLogin(email, password);
    return islogins;
  }

  Future<List<Data>?> fetchUserList()async{
    final userList = await networkService.fetchUsers();
    return userList;
  }
}