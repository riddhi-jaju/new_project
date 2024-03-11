import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo_item.dart';

class ListProvider extends ChangeNotifier {
  List<TodoItem> todos = [];

  void toggleCheckbox(int index, bool value) {
    print('khjgjfd44444sa $value');
    todos[index].isChecked = value;
    notifyListeners();
  }

  void addTodoItem(String title) {
    final newTodo = TodoItem(title: title, isChecked: false);
    todos.add(newTodo);
    notifyListeners();
  }

  void removeTodoItem(int index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
