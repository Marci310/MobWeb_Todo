import 'package:flutter/material.dart';
import 'package:minichallenge2/CoreWorkings/appstate.dart';
import 'package:minichallenge2/CoreWorkings/taskcards.dart';
import 'package:provider/provider.dart';

class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var finished = appState.done;

    ///sets up a the page when there are no tasks added, with and appbar and a text widget
    if (finished.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Tasks Done'),
          ),
          body: Center(
            child: Text('No Tasks Done'),
          ));
    }

    ///sets up the page with listview which holds the tasks, also an appbar and a floating action button which clears the tasks
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks Done'),
        ),
        body: ListView.builder(
          itemCount: finished.length,
          itemBuilder: (context, index) {
            return TaskCard(task: finished[index]);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            appState.clearTasks();
          },
          child: Icon(Icons.clear_all),
        ));
  }
}
