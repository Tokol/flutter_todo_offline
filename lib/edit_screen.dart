import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'database/database.dart';
import 'model/to_do.dart';

class EditScreen extends StatefulWidget {
  final TODO todo;
  String documentId;
  EditScreen({this.todo, this.documentId});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  String todoTask;
  FirebaseFirestore _store = FirebaseFirestore.instance;


  @override
  void initState() {
    // TODO: implement initState
    todoTask = widget.todo.taskName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit'),),
      body: Column(




        children: [
          TextField(
            decoration: InputDecoration(
              hintText: widget.todo.taskName,

            ),

            onChanged: (value){
              todoTask = value;
            },

          ),


          IconButton(icon: Icon(Icons.add),onPressed: () async {
            TODO todo = TODO(taskName: todoTask, isComlete:widget.todo.isComlete);
            await _store.collection("todo").doc(widget.documentId).update({
              "name":todoTask,
               "isComplete":false,
            });


              Navigator.pop(context);


          },),


        ],

      ),
    );
  }
}
