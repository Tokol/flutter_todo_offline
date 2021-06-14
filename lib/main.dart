import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_offline/database/database.dart';
import 'package:flutter_app_offline/statemanagment/home_provider.dart';
import 'package:flutter_app_offline/statemanagment/todos_brain.dart';
import 'package:flutter_app_offline/todo_screen.dart';
import 'package:flutter_app_offline/ui/login.dart';
import 'package:flutter_app_offline/ui/splash_screen.dart';
import 'package:provider/provider.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();

  await DB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TODOBRAIN>(
      create: (context)=> TODOBRAIN(),

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomeScreenDemo(),
      ),
    );
  }
}

