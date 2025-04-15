import 'package:flutter/material.dart';
import 'package:todo_app/screens/todo_functionality.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Write your todo title',
                  ),
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'Enter your todo title';
                    }
                    else{
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _descriptionTEController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Write your description here',
                  ),
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'Enter your description';
                    }
                    else{
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Todo todo = Todo(
                            title: _titleTEController.text.trim(),
                            description: _descriptionTEController.text.trim()
                        );
                        Navigator.pop(context, todo);
                      }
                    },
                    child: const Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
