import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list/app/core/modules/todo_list_page.dart';

abstract class TodoListModule {
  final Map<String, WidgetBuilder> _router;
  final List<SingleChildWidget>? _bindings;

  TodoListModule(
      {List<SingleChildWidget>? bindings,
      required Map<String, WidgetBuilder> router})
      : _bindings = bindings,
        _router = router;

  Map<String, WidgetBuilder> get routers {
    return _router.map(
      (key, pageBuider) => MapEntry(
        key,
        (_) => TodoListPage(
          page: pageBuider,
          bindings: _bindings,
        ),
      ),
    );
  }
}
