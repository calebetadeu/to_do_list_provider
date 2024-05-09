import 'package:flutter/material.dart';
import 'package:to_do_list_provider/app/core/ui/theme_extensions.dart';

class ToDoListLogo extends StatelessWidget {
  const ToDoListLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
        Text(
          'Todo List',
          style: context.textTheme.headlineLarge,
        )
      ],
    );
  }
}
