import 'package:path/path.dart';
import 'package:to_do_list_provider/app/core/modules/todo_list_provider.dart';
import 'package:to_do_list_provider/app/modules/home/home_page.dart';

class HomeModule extends TodoListModule {
  HomeModule()
      : super(
          bindings: [
           
          
          ],
          routers: {
            '/home':(context)=> HomePage(),
          },
        );
}
