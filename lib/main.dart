import 'package:flutter/material.dart';
import 'package:flutter_login_cubit/approuter.dart';

void main() {
  runApp(MyApp(AppRouter()));
}

class MyApp extends StatelessWidget {
  AppRouter router;
  MyApp(this.router);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
