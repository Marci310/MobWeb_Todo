import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task.dart';
import 'package:minichallenge2/CoreWorkings/appstate.dart';

///The calss for the task card
class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Task task;

  ///Creates a card which utilizes the appstate's data and also creates a button which can change the task between pending and completed tasks
  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<AppState>();

    return ListTile(
      title: Text(task.Name),
      subtitle: Text('${task.Description}\nDue: ${task.Date}'),
      trailing: IconButton(
        icon: Icon(Icons.check_box_outline_blank),
        onPressed: () {
          appstate.toggleTasks(task);
        },
      ),
    );
  }
}
