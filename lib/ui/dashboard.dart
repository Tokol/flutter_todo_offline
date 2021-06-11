
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_offline/model/to_do.dart';

import '../edit_screen.dart';
import 'add_task.dart';
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {



 FirebaseFirestore _store = FirebaseFirestore.instance;

 bool isVisible = false;

String taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),

      actions: [IconButton(icon: Icon(Icons.add), onPressed: ()  {
    setState(() {
      isVisible = true;
    });



      })],
      ),

      body: Column(








        children: [



          Visibility(
            visible: isVisible,
            child: Container(

              child: Column(
                children: [


                  TextField(
                    decoration: InputDecoration(
                        hintText: 'add task'

                    ),

                    onChanged: (value){
                      taskName = value;
                    },

                  ),


                  IconButton(icon: Icon(Icons.add),onPressed: () async {
                    setState(() {
                      isVisible = false;
                    });

                    _store.collection("todo").add({

                      "name":taskName,
                      "isComplete":false,

                    });





                  },),


                ],


              ),

            ),
          ),


















          Expanded(

            child: StreamBuilder<QuerySnapshot>(
            stream: _store.collection("todo").snapshots(),

            builder: (context, snaphshot){
    if(snaphshot.hasData){


        return ListView.builder(

            itemCount: snaphshot.data.size,

              itemBuilder: (context,position){

                var data = snaphshot.data.docs;

              var serverTodo = data[position];

            TODO _todo = TODO(taskName:serverTodo["name"], isComlete: serverTodo["isComplete"] );


        return  Container(
                child: Column(children: [


                  Text(_todo.taskName),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      IconButton(icon: Icon(Icons.edit), onPressed: () async {

                        var response =  await   Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen(
                          todo: _todo,
                          documentId: data[position].id,

                        )));



                      }),
                      IconButton(icon: Icon(Icons.delete), onPressed: () async {
                await _store.collection("todo").doc(data[position].id).delete();

                      }),


                    ],)


                ],)



            );




        });


    }

            },


        ),
          ),

    ]
      )





    );
  }
}
