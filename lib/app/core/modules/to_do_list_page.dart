import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ToDoListPage extends StatelessWidget {
  final List<SingleChildWidget>? _bindings;
  final WidgetBuilder _page;

  const ToDoListPage({
    super.key,
    List<SingleChildWidget>? bindings,
    required WidgetBuilder page,
  })  : _bindings = bindings,
        _page = page;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _bindings ?? [Provider(create: (_) => Object())],
      child: Builder(builder: (context) => _page(context)),
    );
  }
}
