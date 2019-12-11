import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'main.dart';

class MyDialog extends StatefulWidget {
  @override
  createState() => MyDialogState();
}

enum Department { treasury, state }

BuildContext myContext;

class MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    myContext = context;
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('SimpleDialog'), onPressed: () => _simpleDialog()),
          RaisedButton(
              child: Text('AlertDialog'),
              onPressed: () {
                _alertDialog();
              }),
          RaisedButton(
              child: Text('BottomSheet'),
              onPressed: () {
                _showBottomSheet();
              }),
          RaisedButton(child: Text('ExpansionPanel'), onPressed: () {}),
          RaisedButton(
              child: Text('SnackBar'),
              onPressed: () {
                _snackBar();
              }),
        ],
      ),
    );
  }

  Future<void> _simpleDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
              child: Icon(Icons.account_balance),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Fluttertoast.showToast(msg: '1111');
                  Navigator.pop(context);
                },
                child: Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Fluttertoast.showToast(msg: '222');
                  Navigator.pop(context);
                },
                child: const Text('State department'),
              ),
              Center(
                child: RaisedButton(
                  child: Text('确定'),
                  color: Colors.red,
                  textTheme: ButtonTextTheme.primary,
                  //矩形
//                      shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xFFFFFF00), style: BorderStyle.solid, width: 2)),
                  //圆形
//                      shape: CircleBorder(side: BorderSide(color: Color(0xFFFFFF00), style: BorderStyle.solid, width: 1)),
                  // 角形（八边角）边色
//                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 0)),
                  //圆角矩形
                  shape: new StadiumBorder(
                      side: new BorderSide(
                    style: BorderStyle.solid,
                    color: Color(0xffFF7F24),
                  )),
                  // 底部线
//                      shape: UnderlineInputBorder( borderSide:BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2)),

                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        });
  }

  // 提示框
  Future<void> _alertDialog() async {
    await showDialog(
        context: context,
//        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('警告')),
            titleTextStyle: TextStyle(color: Colors.green, fontSize: 20.0),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('您的登录已过期，请重新登录'),
//                  Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('登录'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Fluttertoast.showToast(msg: '登录');
                },
              ),
            ],
          );
        });
  }

  Future<void> _snackBar() async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('SnackBar0'),
      backgroundColor: Colors.purpleAccent,
      duration: Duration(seconds: 3),
      action: SnackBarAction(
          label: 'scackbar按钮',
          onPressed: () {
            Fluttertoast.showToast(msg: 'scackbar按钮');
          }),
    ));
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
//                        padding: EdgeInsets.only(top: 20.0),
            height: 150.0,
            child: Column(
              //将主轴空白区域均分，使各个子控件间距相等
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                          icon: Image.asset(
                            'images/icon_friend_circle.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                          onPressed: () {
                            Fluttertoast.showToast(msg: '朋友圈');
                            Navigator.pop(context);
//                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyApp()));
                          }),
                      IconButton(
                          icon: Image.asset(
                            'images/icon_wx_share.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                          onPressed: () {
                            Fluttertoast.showToast(msg: '微信');
                            Navigator.pop(context);
//                            Navigator.pop(myContext);
                          }),
                    ],
                  ),
                  flex: 6,
                ),
                Divider(
                  height: 1.0,
                  indent: 0.0,
                  color: Colors.grey,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Text(
                          '取消',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onTap: () {
                          Fluttertoast.showToast(msg: '取消');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  flex: 4,
                )
              ],
            ),
          );
        });
  }
}
