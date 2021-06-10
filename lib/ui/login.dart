
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_offline/ui/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
import 'common_widget.dart';
import 'dashboard.dart';


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {


  String username;
  String password;

FirebaseAuth _auth = FirebaseAuth.instance;


bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                height: 20,
              ),
              Headings("Enter Your Account"),
              Text("Enter your e-mail",style: ksubheaders,),
              TextFields(label: "email",onChange: (value){
                            username =value;
              },),
              Text("Enter your password",style: ksubheaders,),
              TextFields(

                label: "password", onChange: (value){

                  password = value;



              },),
           loading? Text('Loading'): GestureDetector(
                  onTap: () async {
                        setState(() {
                          loading=true;
                        });
                        
                        try{
                          var user = await _auth.signInWithEmailAndPassword(email: username, password: password);
                          setState(() {
                            loading=false;
                          });

                          if(user!=null){
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool(kLOGIN_KEY, true);
                            prefs.setString(kEMAIL_KEY, username);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashboardScreen()));


                          }
                        }

                        catch(e){
                          setState(() {
                            loading=false;
                          });

                          print(e.toString());
                        }

                  },
                  child: Headings("Log In")),

              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("Don't have an account yet?",style: TextStyle(
                      fontSize: 18,)),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Register()));

                      },
                      child: Text("Sign up ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,

                        ),),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}