import 'package:flutter/material.dart';

import 'database/database.dart';
import 'model/to_do.dart';

class TODOApp extends StatefulWidget {
  @override
  _TODOAppState createState() => _TODOAppState();
}

class _TODOAppState extends State<TODOApp> {


  List<TODO> todoList = [];

  bool insertData  =false;

  String taskNameValue = "";





Future<List<TODO>> getTodos() async {

  todoList =  await DB.getTodods();
  setState(() {

  });
  return todoList;


  }


  @override
  void initState() {
    getTodos();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODO'),
      actions:[
                IconButton(icon: Icon(Icons.add),onPressed: (){

          setState(() {
            insertData = true;
          });


    },),

      ],

      ),
      body: Column(
        children: [

          Visibility(
            visible: insertData,
            child: Expanded(child: Container(



              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                Text('Task name'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    onChanged: (value){
                      taskNameValue = value;

                    },


                  ),
                ),


                TextButton(onPressed: () async {
                  TODO todoApp = TODO(taskName: taskNameValue, isComlete: false);
                  
                 await DB.insert(todoApp);
                  setState(() {
                    insertData = false;
                  });

                  getTodos();




                }, child: Text('Save'))



              ],),




            )),
          ),

          Expanded(
            child: Container(
              child:ListView.builder(itemBuilder: (context, position){

                return Container(
                  child: Text(todoList[position].taskName),

                );

              }, itemCount: todoList.length,),


            ),
          ),


        ],

      )



    );
  }
}
