// ignore_for_file: unnecessary_new, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'To do List', home: new TodoList());
  }
}

// ignore: use_key_in_widget_constructors
class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  // This will be called each time the + button is pressed
  void _addTodoItem() {
    // Putting our code inside "setState" tells the app that our state has changed, and
    // it will automatically re-render the list
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        // itemBuilder will be automatically be called as many times as it takes for the
        // list to fill up its available space, which is most likely more than the
        // number of todo items e have. So, we need to check the index is OK.
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        }
        return _buildTodoItem('');
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText) {
    return new ListTile(title: new Text(todoText));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodoItem,
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }
}
