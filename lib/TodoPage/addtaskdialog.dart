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
  String date =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

  ///Overriding the destructor so it fits our own scenario
  @override
  void dispose() {
    _nameController.dispose();
    _desriptionController.dispose();
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              controller: _desriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
          ),

          ///Due Date of the task button
          ElevatedButton(
            onPressed: () async {
              final initialDate = DateTime.now();

              ///Sets up the date picker from todays date until the year 2100
              final newDate = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (newDate != null) {
                ///Sets the controller up with the variable picked
                setState(() {
                  date = '${newDate.year}-${newDate.month}-${newDate.day}';
                });
              }
            },
            child: Text('Select Date'),
          ),

          ///writes out the selected date
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Selected date: $date'),
          )
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
            appstate.addTask(Task(name, description, date));
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
