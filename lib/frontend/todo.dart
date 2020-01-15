import 'package:flutter/material.dart';
import 'package:layout_training/widgets/drawer.dart';
import 'package:sqflite/sqflite.dart';

class Todo {
  String todo;

  Todo(String todo) {
    this.todo = todo;
  }
}

class TodoScreen extends StatefulWidget {
  TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todos = new List<Todo>();
  List<Todo> completedTodos = new List<Todo>();

  String newTodoInput;

  void _addTodo(Todo todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void _completeTodo(int index) {
    setState(() {
      Todo td = Todo(todos[index].todo);
      setState(() {
        todos.removeAt(index);
        completedTodos.add(td);
      });
    });
  }

  void _uncompleteTodo(int index) {
    setState(() {
      Todo td = Todo(completedTodos[index].todo);
      setState(() {
        completedTodos.removeAt(index);
        todos.add(td);
      });
    });
  }

  void _removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      drawer: Drawer(child: DrawerCustom()),
      appBar: AppBar(title: Text('Todo list')),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 35),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Center(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            autofocus: true,
                            onChanged: (v) {
                              setState((){
                                newTodoInput = v;
                              });
                            }
                          ),
                          FlatButton(child: Text("Adicionar"), onPressed: () {
                            _addTodo(Todo(newTodoInput));
                            Navigator.of(context, rootNavigator: true).pop();
                          })
                        ],
                      ),
                    ),
                  );
                });
          }),
      body: Container(
          child: Column(children: [
        Container(
            padding: EdgeInsets.all(32),
            child: Text('Todo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        Flexible(
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(onTap: () {
                  _completeTodo(index);
                }, title: Text(todos[index].todo));
              }),
        ),
        Container(
            padding: EdgeInsets.all(32),
            child: Text('Completed',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        Flexible(
          child: ListView.builder(
              itemCount: completedTodos.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(onTap: () {
                  _uncompleteTodo(index);
                }, title: Text(completedTodos[index].todo, style: TextStyle(decoration: TextDecoration.lineThrough)));
              }),
        )
      ])),
    ));
  }
}
