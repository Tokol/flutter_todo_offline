import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  String appTitle="";



  @override
  void initState() {
    getuserPref();
    super.initState();
  }



  getuserPref() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String langPref =  prefs.getString("lang")?? "Eng";


    if(langPref=="Eng"){
      appTitle = "Setting";
    }

    else if (langPref=="Nep"){
      appTitle = "सेटिंग";
    }

    setState(() {

    });


  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle),),
      body: Column(
        children: [

          TextButton(onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString("lang", "Nep");

            getuserPref();


          }, child: Text('Nepali')),

          TextButton(onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            prefs.setString("lang", "Eng");
            getuserPref();


          }, child: Text('English')),


        ],
      ),

    );
  }
}
