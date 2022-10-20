// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors
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
  void _addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
        return _buildTodoItem('', 1);
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(title: new Text(todoText),
    onTap: ()=> _promptRemoveTodoItem(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Todo List')),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: Text('Add a new task')),
          body: TextField(
              autofocus: true,
              onSubmitted: (val) {
                _addTodoItem(val);
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  hintText: 'Enter something to do...',
                  contentPadding: const EdgeInsets.all(16.0))));
    }));
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Mark "${_todoItems[index]}"as done?'),
              actions: <Widget>[
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    },
                    child: Text('MARK AS DONE'))
              ]);
        });
  }
}
