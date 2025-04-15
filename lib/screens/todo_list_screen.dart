import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_new_todo_screen.dart';
import 'package:todo_app/screens/update_todo_screen.dart';

import 'todo_functionality.dart';


class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  void _showChangeStatusDialogue(index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Change Status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Idle'),
                  onTap: () {
                    _onTapUpdateStatusButton(index, todoStatus.idle);
                  },
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  title: const Text('In progress'),
                  onTap: () {
                    _onTapUpdateStatusButton(index, todoStatus.inProgress);
                  },
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  title: const Text('Done'),
                  onTap: () {
                    _onTapUpdateStatusButton(index, todoStatus.done);
                  },
                )
              ],
            ),
          );
        });
  }

  void _onTapUpdateStatusButton(int index, todoStatus status){
    _updateTodoStatus(index, status);
    Navigator.pop(context);
  }

  final List<Todo> listOfTodo = [];

  void _addTodo(Todo todo){
    listOfTodo.add(todo);
    setState(() {});
  }

  void _deleteTodo(index){
    listOfTodo.removeAt(index);
    setState(() { });
  }

  void _updateTodo(index, Todo todo){
    listOfTodo[index] = todo;
  }

  void _updateTodoStatus(int index, todoStatus status){
    listOfTodo[index].status = status;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Visibility(
        replacement: const Center(child: Text('Todo list is empty')),
        visible: listOfTodo.isNotEmpty,
        child: ListView.builder(
          itemCount: listOfTodo.length,
          itemBuilder: (context, index) {
            Todo todo = listOfTodo[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              leading: Text(todo.status.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        _deleteTodo(index);
                      },
                      icon: const Icon(Icons.delete)),
                  IconButton(
                      onPressed: () => _showChangeStatusDialogue(index),
                      icon: const Icon(Icons.edit)),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateTodoScreen()));
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewTodoScreen()
              )
          );
          if(todo != null){
            _addTodo(todo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
