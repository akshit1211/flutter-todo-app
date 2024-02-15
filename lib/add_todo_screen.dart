import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todo_provider.dart';

class AddTodo extends ConsumerWidget {
  AddTodo({super.key});

  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: todoController,
            decoration:
                const InputDecoration(hintText: 'What needs to be done?'),
          ),
        ),
        SizedBox(
          height: 70,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colorList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorList[index],
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                    ),
                  ),
                );
              }),
        ),
        ElevatedButton(
            onPressed: () {
              //add todo
              final todo = Todo(
                title: todoController.text,
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                isDone: false,
                priority: 1,
              );
              ref.read(todoProvider.notifier).add(todo);
              todoController.clear();
            },
            child: const Text("Add Todo."))
      ]),
    );
  }
}
