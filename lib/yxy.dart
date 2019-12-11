import 'package:flutter/material.dart';

class Yxy extends StatefulWidget{
  @override
  createState() =>  MyYxyState();

}

class MyYxyState extends State<Yxy>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('myYxy'),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(
          valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),
        ),

      ),
    );
  }

}