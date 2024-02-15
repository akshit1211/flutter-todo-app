import 'package:flutter/material.dart';
import 'package:flutter_todo/constants.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'What needs to be done?'),
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
                    onTap: () {
                      
                    },
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
        )
      ]),
    );
  }
}
