import 'package:flutter/material.dart';
import 'package:todo_mvvm/home/modal.dart';

class HomeViewModal with ChangeNotifier {
  final List<Todo> _todos = <Todo>[];

  List<Todo> get todos => _todos;

  void add(String description) {
    _todos.add(Todo(title: "Todo 1", description: description));
    notifyListeners();
  }

  void remove(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void changeStatus(int index) {
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }
}
