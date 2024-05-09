import 'package:flutter/material.dart';
import 'package:to_do_list_provider/app/core/ui/todo_list_ui_config.dart';
import 'package:to_do_list_provider/app/modules/auth/auth_module.dart';
import 'package:to_do_list_provider/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do List',
      debugShowCheckedModeBanner: false,
      theme: TodoListUiConfig.theme,
      initialRoute: '/login',
      routes: {...AuthModule().routers},
      home: const SplashPage(),
    );
  }
}
