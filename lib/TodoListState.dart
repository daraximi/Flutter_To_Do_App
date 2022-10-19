import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  @override
  createState() => TodoListState();
}

class TodoListState extends State<ToDoList> {
  final List<String> _todoItems = [];

  void _addTodoItem() {
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _todoItems.length) {
        return _buildTodoItem(_todoItems[index]);
      }
      return _buildTodoItem("Nothing to add");
    });
  }

  Widget _buildTodoItem(String todotext) {
    return ListTile(title: Text(todotext));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ToDo List')),
        body: _buildTodoList(),
        floatingActionButton: FloatingActionButton(
            onPressed: _addTodoItem,
            tooltip: 'Add task',
            child: Icon(Icons.add)));
  }
}