import 'package:flutter/material.dart';
import 'package:flutter_app_offline/ui/dashboard.dart';
import 'package:flutter_app_offline/ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    checkUserStatus();
    super.initState();
  }



  void checkUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userLogin = prefs.getBool(kLOGIN_KEY);

    if(userLogin!=null){

      if(userLogin){

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashboardScreen()));
      }


      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LogIn()));
      }

    }

    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LogIn()));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Loading'),),
    body: Center(
      child: CircularProgressIndicator(),

    ),

    );
  }
}
