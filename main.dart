import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Simple To-Do App')),
        body: ToDoScreen(),
      ),
    );
  }
}

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final List<Task> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void addTask() {
    setState(() {
      tasks.add(Task(title: taskController.text));
      taskController.clear();
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: taskController,
            decoration: InputDecoration(labelText: 'Enter a new task'),
          ),
        ),
        ElevatedButton(
          onPressed: addTask,
          child: Text('Add Task'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(tasks[index].title),
                value: tasks[index].isDone,
                onChanged: (value) => toggleTask(index),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Task {
  String title;
  bool isDone;
  Task({required this.title, this.isDone = false});
}
