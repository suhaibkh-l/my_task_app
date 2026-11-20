
import 'package:flutter/material.dart';
import 'homepage.dart';

class CompletedPage extends StatelessWidget {

  final List<Task> tasks;

  const CompletedPage({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {

    final completedTasks =
        tasks.where((task) => task.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
        centerTitle: true,
      ),

      body: completedTasks.isEmpty
          ? const Center(
              child: Text(
                'No completed tasks yet!',
                style: TextStyle(fontSize: 22),
              ),
            )

          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {

                return ListTile(
                  leading: const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  ),

                  title: Text(
                    completedTasks[index].title,
                  ),
                );
              },
            ),
    );
  }
}
