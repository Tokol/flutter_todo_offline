import 'package:flutter/material.dart';

import '../const.dart';


class TextFields extends StatelessWidget {
  final Function(String) onChange;
  final String label;


  TextFields({
    this.onChange,
     this.label,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
      child: TextField(
        style: TextStyle(fontSize: 15, color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          // suffixIcon: Icon(Icons.add),

          labelText: label,


          labelStyle: TextStyle(fontSize: 18, color: Colors.white),
        ),
        onChanged: onChange,
      ),
    );
  }
}

class Headings extends StatelessWidget {
  final String registers;

  Headings(this.registers);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.blue,
      ),
      child: Text(registers, style: kheaders),
    );
  }
}