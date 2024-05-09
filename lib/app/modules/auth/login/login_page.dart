import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_provider/app/core/widget/to_do_list_field.dart';
import 'package:to_do_list_provider/app/core/widget/to_do_list_logo.dart';
import 'package:to_do_list_provider/app/modules/auth/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<LoginController>(context);
    return Scaffold(
      body: LayoutBuilder(builder: ((context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const ToDoListLogo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      child: Column(
                        children: [
                          ToDoListField(label: 'E-mail'),
                          const SizedBox(
                            height: 20,
                          ),
                          ToDoListField(
                            label: 'Senha',
                            isObscureText: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text("Esqueceu sua senha?")),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F3F7),
                        border: Border(
                            top: BorderSide(
                                width: 2, color: Colors.grey.withAlpha(50))),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SignInButton(
                            Buttons.Google,
                            text: 'Continue com Google',
                            padding: const EdgeInsets.all(5),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            onPressed: () {},
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não tem conta?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/register');
                                  },
                                  child: const Text('Cadastre-se'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      })),
    );
  }
}
