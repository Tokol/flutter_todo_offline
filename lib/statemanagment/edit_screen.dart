import 'package:flutter/material.dart';
import 'package:flutter_app_offline/model/to_do.dart';
import 'package:flutter_app_offline/statemanagment/todos_brain.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  final int position;

  EditScreen({this.position});

  String task;

  @override
  Widget build(BuildContext context) {
    return Consumer<TODOBRAIN>(builder: (context, data, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Add task'),
          ),
          body: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: data.getTODO(position).taskName,
                ),
                onChanged: (value) {
                  task = value;
                },
              ),
              TextButton(
                  onPressed: () {
                    data.editTodo(
                        position, TODO(taskName: task, isComlete: false));
                  },
                  child: Text('save'))
            ],
          ));
    });
  }
}
