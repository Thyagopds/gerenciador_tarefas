// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Estudar Flutter', 'assets/images/dash.png'),
    Task('Academia', 'assets/images/academia.jpg'),
    Task('Meditar', 'assets/images/meditar.jpeg'),
    Task('Ler', 'assets/images/livro.jpg'),
    Task('Jogar', 'assets/images/jogar.jpg'),
  ];

  void newTask(String name, String photo){
    taskList.add(Task(name, photo));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
