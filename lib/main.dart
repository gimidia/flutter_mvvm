import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/task_viewmodel.dart';
import 'view/tasklistscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MaterialApp(
        home: TaskListScreen(),
      ),
    );
  }
}
