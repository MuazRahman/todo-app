import 'package:flutter/material.dart';

class UpdateTodoScreen extends StatefulWidget {
  const UpdateTodoScreen({super.key});

  @override
  State<UpdateTodoScreen> createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo'),
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
