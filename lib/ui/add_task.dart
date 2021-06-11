import 'package:flutter/material.dart';
import 'package:flutter_app_offline/model/to_do.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  TODO todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add task'),),

      body: Center(

        child: Container(

          child: Column(
            children: [


              TextField(
                decoration: InputDecoration(
                  hintText: 'add task'

                ),

                onChanged: (value){
                  todo.taskName = value;
                },

              ),


              IconButton(icon: Icon(Icons.add),onPressed: () {

                Navigator.pop(context,todo);


              },),


            ],


          ),

        ),
      ),
    );
  }
}
