import 'package:provider/provider.dart';
import 'package:to_do_list_provider/app/core/modules/todo_list_provider.dart';
import 'package:to_do_list_provider/app/modules/auth/login/login_controller.dart';
import 'package:to_do_list_provider/app/modules/auth/login/login_page.dart';
import 'package:to_do_list_provider/app/modules/auth/register/register_controller.dart';
import 'package:to_do_list_provider/app/modules/auth/register/register_page.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(userService: context.read()),
            ),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
          },
        );
}
