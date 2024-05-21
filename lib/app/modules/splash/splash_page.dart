import 'package:flutter/material.dart';
import 'package:to_do_list_provider/app/core/widget/to_do_list_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ToDoListLogo(),
      ),
    );
  }
}
