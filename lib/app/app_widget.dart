import 'package:flutter/material.dart';
import 'package:todo_list/app/core/database/sqlite_admin_connection.dart';
import 'package:todo_list/app/core/navigator/to_do_list_navigator.dart';
import 'package:todo_list/app/core/ui/todo_list_ui_config.dart';
import 'package:todo_list/app/modules/auth/auth_module.dart';
import 'package:todo_list/app/modules/home/home_module.dart';
import 'package:todo_list/app/modules/splash/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    WidgetsBinding.instance?.addObserver(SqliteAdminConnection());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance?.removeObserver(SqliteAdminConnection());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: TodoListUIConfig.theme,
      navigatorKey: TodoListNavigator.navigatorKey,
      routes: {...AuthModule().routers, ...HomeModule().routers},
      home: SplashPage(),
    );
  }
}
