import 'package:flutter/material.dart';

import 'mywebview.dart';

class Login extends StatefulWidget{
  @override
  createState() =>  MyLoginState();

}

class MyLoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('myLogin'),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('myLogin'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyWebView()));
            }
        ),
      ),
    );
  }

}