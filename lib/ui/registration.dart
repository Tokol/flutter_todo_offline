import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
import 'common_widget.dart';
import 'dashboard.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String username;
  String password;

  FirebaseAuth _auth = FirebaseAuth.instance;


  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Headings("Register"),
                  Row(
                    children: [
                      Expanded(
                          child: TextFields(
                            label: "First Name",

                            onChange: (value) {},
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFields(
                            label: "Last Name",

                            onChange: (value) {},
                          ))
                    ],
                  ),
                  Text(
                    "Enter your phone number",
                    style: ksubheaders,
                  ),
                  TextFields(
                    label: "phone:",

                    onChange: (value) {},
                  ),
                  Text(
                    "Enter your e-mail address",
                    style: ksubheaders,
                  ),
                  TextFields(
                    label: "e-mail",

                    onChange: (value) {

                      username = value;
                    },
                  ),
                  Text(
                    "Create a new password",
                    style: ksubheaders,
                  ),
                  TextFields(
                    label: "create a password",

                    onChange: (value) {
                      password = value;

                    },
                  ),
                  loading? Text('Loading'): GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading=true;
                        });

                        try{
                          var user = await _auth.createUserWithEmailAndPassword(email: username, password: password);
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
                      child: Headings("Sign up")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Already have an account ?",style: TextStyle(
                          fontSize: 18,)),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, "logIn");

                          },
                          child: Text("Log-In",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,

                            ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}