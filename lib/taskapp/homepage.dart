
import 'package:flutter/material.dart';
import 'completed.dart';

class Task {
  String title;
  bool isCompleted;

  Task({
    required this.title,
    this.isCompleted = false,
  });
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Task> tasks = [
    Task(title: 'Study '),
    Task(title: ' Homework'),
    Task(title: 'Read a Book'),
    Task(title: ' Programming'),
  ];

  @override
  Widget build(BuildContext context) {

    int completedCount =
        tasks.where((task) => task.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CompletedPage(tasks: tasks),
                ),
              );

              setState(() {});
            },
          ),
        ],
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Completed: $completedCount / ${tasks.length}',
              style: const TextStyle(
                color: Color.fromARGB(0, 79, 79, 138),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {

                return ListTile(
                  title: Text(
                    tasks[index].title,
                    style: TextStyle(
                      decoration: tasks[index].isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),

                  trailing: Checkbox(
                    value: tasks[index].isCompleted,
                    onChanged: (value) {
                      setState(() {
                        tasks[index].isCompleted =
                            value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
