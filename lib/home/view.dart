import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mvvm/home/view_modal.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String description = "";

  @override
  Widget build(BuildContext context) {
    final homeViewModal = Provider.of<HomeViewModal>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (text) {
                    description = text;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Task description',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => homeViewModal.add(description),
                child: const Text("Add"),
              ),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: homeViewModal.todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(homeViewModal.todos[index].description, style: TextStyle(color: homeViewModal.todos[index].isDone ? Colors.green : Colors.black),)),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => homeViewModal.changeStatus(index),
                        child: Text(homeViewModal.todos[index].isDone ? "Undone" : "Done"),
                      ),
                      ElevatedButton(
                        onPressed: () => homeViewModal.remove(index),
                        child: const Text("Add"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
