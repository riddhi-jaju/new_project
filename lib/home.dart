import 'package:flutter/material.dart';
import 'package:todo_list_app/list_item.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/list_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(
      builder: (context, listItemProvider, _) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 233, 230, 230),
          appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(100), // Set the preferred height
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 2, 114, 125),
              centerTitle: true, // Set the background color
              title: const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'ToDo List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: listItemProvider.todos.length,
            itemBuilder: (context, index) {
              return ListItem(
                todoItem: listItemProvider.todos[index],
                onCheckboxToggle: (value) =>
                    listItemProvider.toggleCheckbox(index, value),
                onDelete: () => listItemProvider.removeTodoItem(index),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String textFieldValue = '';

                  return AlertDialog(
                    title: const Text('Add Task'),
                    content: TextField(
                      onChanged: (value) {
                        textFieldValue = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your task',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          listItemProvider.addTodoItem(textFieldValue);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 114, 125),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: const Color.fromARGB(255, 2, 114, 125),
            shape: const CircleBorder(side: BorderSide.none),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
