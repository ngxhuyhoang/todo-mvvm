import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mvvm/home/view.dart';
import 'package:todo_mvvm/home/view_modal.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModal())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
