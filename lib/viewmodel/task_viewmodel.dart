import 'package:flutter/material.dart';
import '../model/task.dart';
import '../utils/result.dart';
import '../utils/command.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
  Command? addTaskCommand;
  TaskViewModel() {
    addTaskCommand = Command(
      execute: () => addTask("New Task"),
      canExecute: () => true,
    );
  }
  Result<void> addTask(String title) {
    if (title.isEmpty) {
      return Result.failure("Title cannot be empty");
    }
    _tasks.add(Task(id: DateTime.now().toString(), title: title));
    notifyListeners();
    return Result.success(null);
  }

  void toggleTaskCompletion(String id) {
    var task = _tasks.firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }
}
