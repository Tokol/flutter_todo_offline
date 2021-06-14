import 'package:flutter/material.dart';
import 'package:flutter_app_offline/model/to_do.dart';
import 'package:flutter_app_offline/statemanagment/todos_brain.dart';
import 'package:provider/provider.dart';

import 'add_screen_todo.dart';

class HomeScreenDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTask()));
                })
          ],
        ),
        body: Consumer<TODOBRAIN>(builder: (context, data, child) {
          return FutureBuilder<List<TODO>>(
              future: data.getTODOS()??[],
              builder: (context, snaphshot) {
if(snaphshot.hasData){

    return ListView.builder(
    itemCount: snaphshot.data.length,
    itemBuilder: (buildContex, position) {
    TODO _todos = snaphshot.data[position];

    return Container(
    child: Column(
    children: [
    Text(_todos.taskName),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    IconButton(
    icon: Icon(Icons.edit),
    onPressed: () async {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => AddTask()));
    }),
    IconButton(
    icon: Icon(Icons.delete),
    onPressed: () async {
    data.deleteTODO(position);
    }),
    ],
    )
    ],
    ));
    });
    }



else if (snaphshot.data==null){

  return Container();

}




              });
        }));
  }
}
