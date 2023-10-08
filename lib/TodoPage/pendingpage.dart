import 'package:flutter/material.dart';
import 'package:minichallenge2/CoreWorkings/appstate.dart';
import 'package:minichallenge2/CoreWorkings/taskcards.dart';
import 'package:minichallenge2/TodoPage/addtaskdialog.dart';
import 'package:provider/provider.dart';

class PendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<AppState>();
    var tasks = appstate.pending;

    ///sets up a page when there are no tasks added, with an appbar, a text widget, and a floating actionbutton so tasks can be added utilizing the add0askdialog
    if (tasks.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Pending Tasks'),
          ),
          body: Center(
            child: Text('No Pending Tasks'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddTaskDialog();
                },
              );
            },
            child: Icon(Icons.add),
          ));
    }

    ///sets up the page with listview which holds the tasks, also an appbar and a floating action button which ccan add additional tasks utilizing the addtaskdialog
    return Scaffold(
        appBar: AppBar(
          title: Text('Pending Tasks'),
        ),
        body: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(task: tasks[index]);
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddTaskDialog();
              },
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
