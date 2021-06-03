import 'package:flutter/material.dart';
import 'package:flutter_app_offline/edit_screen.dart';
import 'package:flutter_app_offline/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


  String appTitle="";



Future<List<TODO>> getTodos() async {

  todoList =  await DB.getTodods();

  setState(() {

  });

 if(todoList!=null){
   return todoList;

 }

    return null;


  }


  @override
  void initState() {
    getTodos();
    getuserPref();

    super.initState();
  }


  getuserPref() async {

       SharedPreferences prefs = await SharedPreferences.getInstance();

      String langPref =  prefs.getString("lang")?? "Eng";


    if(langPref=="Eng"){
      appTitle = "TODO";
    }

    else if (langPref=="Nep"){
      appTitle = "गर्नु पर्ने";
    }


    setState(() {

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle),
      actions:[
                IconButton(icon: Icon(Icons.add),onPressed: (){

          setState(() {
            insertData = true;
          });


    },),


        IconButton(icon: Icon(Icons.settings),onPressed: () async {

             await Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingScreen(




             )));

              getuserPref();
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
              child:todoList!=null ?ListView.builder(


                itemBuilder: (context, position){

                  return Container(
                      child: Column(children: [

                        Text(todoList[position].taskName),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            IconButton(icon: Icon(Icons.edit), onPressed: () async {

                            var response =  await   Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen(
                                todo:todoList[position],

                              )));

                                getTodos();

                            }),
                            IconButton(icon: Icon(Icons.delete), onPressed: () async {

                              await DB.delete(todoList[position].id);
                              getTodos();

                            }),


                          ],)


                      ],)



                  );

                }, itemCount: todoList.length):Container()


            ),
          ),


        ],

      )



    );
  }
}
