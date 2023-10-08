import 'package:flutter/material.dart';
import 'task.dart';

class AppState extends ChangeNotifier {
  var pending = <Task>[];
  var done = <Task>[];

  ///Adds a new task to the pending list and notifies all the listeners
  void addTask(Task newTask) {
    pending.add(newTask);
    notifyListeners();
  }

  ///Switches tasks between pending or done depending on where they are then notifies all listeners
  void toggleTasks(Task chosen) {
    if (pending.contains(chosen)) {
      pending.remove(chosen);
      done.add(chosen);
    } else {
      done.remove(chosen);
      pending.add(chosen);
    }
    notifyListeners();
  }

  ///Clears the done list if needed then notifies all the listeners
  void clearTasks() {
    done.clear();
    notifyListeners();
  }
}
