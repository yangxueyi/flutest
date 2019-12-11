import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttertoast/fluttertoast.dart';

class MySharedPreferences extends StatelessWidget {

  // TextEditing控制器，可以获取 TextEditing的输入内容
  var textController = new TextEditingController();
  final int index;
  MySharedPreferences({Key key , this.index}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('SharedPreferences'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child:  TextField(
                controller: textController,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  hintText: '请输入密码',
//              labelText: '密码',
                  prefixIcon: Icon(Icons.add),
                ),
              ),
            ),
           
            RaisedButton(
                child: Text('保存数据'),
                onPressed: () {
                  _saveData();
                }),
            RaisedButton(
                child: Text('获取数据'),
                onPressed: () {
                  _getData();
                }),
            RaisedButton(
              child: Text('显示上个页面数据'),
                onPressed: () {
                  Fluttertoast.showToast(msg: '$index');
                }
            )
          ],
        ),
      ),
    );
  }

  _saveData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('count', textController.text);
  }

  _getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String cou = sp.get('count');
    Fluttertoast.showToast(msg: cou);
  }
}
