import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyTextField extends StatefulWidget {
  @override
  createState() => TextFieldState();
}

class TextFieldState extends State<MyTextField> {

  var inputTextStr = '';

  // TextEditing控制器，可以获取 TextEditing的输入内容
  var textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyContent(),
    );
  }

  Widget _bodyContent() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 30.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: textController,
//            obscureText: true,
            style: TextStyle(fontSize: 20.0),
            maxLength: 15,
//            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: '请输入密码',
//              labelText: '密码',
              prefixIcon: Icon(Icons.add),
//              suffixIcon: Icon(Icons.access_time),
//              contentPadding: EdgeInsets.symmetric(vertical: 1.0),
//            border:InputBorder.none//去除下划线
//              border: OutlineInputBorder(//设置输入框风格
//                borderRadius: BorderRadius.circular(50.0)
//              )
            ),
            onChanged: (v) {
              //保存输入值到变量
              inputTextStr = v;
            },
          ),
          RaisedButton(
            onPressed: () {
              Fluttertoast.showToast(msg: textController.text);
            },
            child: Text('登陆'),
          )
        ],
      ),
    );
  }
}
