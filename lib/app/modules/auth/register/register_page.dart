import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list_provider/app/core/ui/theme_extensions.dart';
import 'package:to_do_list_provider/app/core/widget/to_do_list_field.dart';
import 'package:to_do_list_provider/app/core/widget/to_do_list_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 16, color: context.primaryColor),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 18, color: context.primaryColor),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).width * .5,
            child: const FittedBox(
              child: ToDoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
                child: Column(
              children: [
                ToDoListField(
                  label: 'E-mail',
                ),
                const SizedBox(
                  height: 20,
                ),
                ToDoListField(label: 'Senha', isObscureText: true),
                const SizedBox(
                  height: 20,
                ),
                ToDoListField(label: 'Confirma Senha', isObscureText: true),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Salvar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
