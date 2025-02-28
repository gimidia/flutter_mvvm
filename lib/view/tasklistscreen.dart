import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/task_viewmodel.dart';

class TaskListScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'New Task'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              var result = Provider.of<TaskViewModel>(context, listen: false)
                  .addTask(_controller.text);
              if (result.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result.error!)),
                );
              } else {
                _controller.clear();
              }
            },
            child: Text('Add Task'),
          ),
          Expanded(
            child: Consumer<TaskViewModel>(
              builder: (context, taskViewModel, child) {
                return ListView.builder(
                  itemCount: taskViewModel.tasks.length,
                  itemBuilder: (context, index) {
                    var task = taskViewModel.tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          taskViewModel.toggleTaskCompletion(task.id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
