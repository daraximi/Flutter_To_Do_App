// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:basic_flutter_app/TodoListState.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To do List',
        home: Scaffold(appBar: AppBar(title: Text('My To-do List'))));
  }
}
