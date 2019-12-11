import 'package:flutter/material.dart';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

import 'two.dart';
import 'mycamera.dart';
import 'mysharedpreferences.dart';
import 'qrCode.dart';
import 'myTimer.dart';

import 'utils/DeviceInfoUtils.dart';

//class Home extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: MyHome(),
//    );
//  }
//
//}

class Home extends StatefulWidget {
  @override
  createState() => MyHomeState();
}

class MyHomeState extends State<Home> {
  String textStr = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('myHome'),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[

          Container(
              width: 60.0,
              height: 30.0,
              margin: EdgeInsets.only(top:20.0),
              child: Center(
                child: Text('VIP',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20))

          ),
          ),


          FlatButton(
            onPressed: _buttonClick,
            child: Text('demo'),
            color: Colors.amber,
            //矩形 设置四个角的角度，可变成别的样式
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Color(0xFFFFFF00),
                    style: BorderStyle.solid,
                    width: 0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20))),
            //圆形
//                      shape: CircleBorder(side: BorderSide(color: Color(0xFFFFFF00), style: BorderStyle.solid, width: 1)),
            // 角形（八边角）边色
//                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 0)),
            //圆角矩形
//              shape:new StadiumBorder(side: new BorderSide(style: BorderStyle.solid,color: Color(0xffFF7F24),)),
            // 底部线
//                      shape: UnderlineInputBorder( borderSide:BorderSide(color: Color(0xFFFFFFFF), style: BorderStyle.solid, width: 2)),
          ),
          FlatButton(
            onPressed: () {
              debugDumpApp();
            },
            child: Text('debug'),
            color: Colors.amber,
            //圆角矩形
            shape: new StadiumBorder(
                side: new BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffFF7F24),
            )),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImagePickerWidget()));
            },
            child: Text('camera'),
            color: Colors.amber,
            //圆角矩形
            shape: new StadiumBorder(
                side: new BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffFF7F24),
            )),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MySharedPreferences(
                            index: 123,
                          )));
            },
            child: Text('SharedPreferences'),
            color: Colors.amber,
            //圆角矩形
            shape: new StadiumBorder(
                side: new BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffFF7F24),
            )),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyQrCode()));
            },
            child: Text('QrCode'),
            color: Colors.amber,
            //圆角矩形
            shape: new StadiumBorder(
                side: new BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffFF7F24),
            )),
          ),
          //获取设备信息
          FlatButton(
            onPressed: () {
              getDeviceInfo();
            },
            child: Text('deviceInfo'),
            color: Colors.amber,
            //圆角矩形
            shape: new StadiumBorder(
                side: new BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffFF7F24),
            )),
          ),
          //获取设备信息
          FlatButton(
            onPressed: () {
              getPackageInfo();
            },
            child: Text('packageInfo'),
            color: Colors.amber,
            //圆角矩形
            shape: new StadiumBorder(
                side: new BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffFF7F24),
            )),
          ),
          //获取设备信息
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyTimer()));
            },
            child: Text('mytimer'),
            color: Colors.amber,
            //圆角矩形
            shape: new StadiumBorder(
                side: new BorderSide(
              style: BorderStyle.solid,
              color: Color(0xffFF7F24),
            )),
          ),
          Text(textStr)
        ],
      )),
    );
  }

  void _buttonClick() {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => new MyTwo()));
    Navigator.push(context, CustomRouteSlide(MyTwo()));
//    Navigator.push(context,_createRoute());
  }

  //获取设备信息
  void getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

    setState(() {
      AndroidBuildVersion version = androidInfo.version;
      textStr = androidInfo.brand +
          "-------" +
          androidInfo.androidId +
          "------android:" +
          version.sdkInt.toString();
    });
  }

  void getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    print(appName +
        "------" +
        packageName +
        "------" +
        version +
        "------" +
        buildNumber);
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyTwo(),
    transitionDuration: const Duration(seconds: 5), //动画时长
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

//滑动效果
class CustomRouteSlide extends PageRouteBuilder {
  final Widget widget;

  CustomRouteSlide(this.widget)
      : super(
//      transitionDuration:const Duration(seconds:1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation1, curve: Curves.fastOutSlowIn)),
            child: child,
          );
        });
}
