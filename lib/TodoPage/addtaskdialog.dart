import 'package:flutter/material.dart';
import 'package:minichallenge2/CoreWorkings/appstate.dart';
import 'package:minichallenge2/CoreWorkings/task.dart';
import 'package:provider/provider.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

///Creates the controller variables fot the textfields and the date picker
class _AddTaskDialogState extends State<AddTaskDialog> {
  final _nameController = TextEditingController();
  final _desriptionController = TextEditingController();
  final _dateController = TextEditingController();

  ///Overriding the destructor so it fits our own scenario
  @override
  void dispose() {
    _nameController.dispose();
    _desriptionController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  ///Creates an Alertdialog which pops up when we want to create a new task
  @override
  Widget build(BuildContext context) {
    var appstate = context.watch<AppState>();
    return AlertDialog(
      title: Text('Add New Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///Name of the task Textfield
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Task Name',
            ),
          ),

          ///Description of the task Textfield
          TextField(
            controller: _desriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),

          ///Due Date of the task button
          GestureDetector(
            onTap: () async {
              final initialDate = DateTime.now();
              final newDate = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (newDate != null) {
                ///Sets the controller up with the variable picked
                setState(() {
                  _dateController.text = newDate.toString();
                });
              }
            },
            child: AbsorbPointer(
              ///writes out the selected date
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Due Date',
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          ///after clicking the add button the dialog closes and adds a new Task to the list of tasks in the appstate
          onPressed: () {
            final name = _nameController.text;
            final description = _desriptionController.text;
            final date = _dateController.text;
            appstate.addTask(Task(name, description, date));
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
