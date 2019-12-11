import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 添加


import 'main.dart';

void main() => runApp(new MyApp());

BuildContext myContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    myContext = context;
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),


      // 添加国际化
      localizationsDelegates: [                             //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [                                   //此处
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List list = new List();

  @override
  void initState() {
    super.initState();
    list.add('images/splash_1.png');
    list.add('images/splash_2.png');
    list.add('images/splash_3.png');
    list.add('images/splash_4.png');

  }

  @override
  void dispose() {
    super.dispose();
//    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  new Swiper(
        itemBuilder: (BuildContext context,int index){
//          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
          return Image.asset(list[index],fit: BoxFit.fill,);
        },
        itemCount: 4,
        pagination: new SwiperPagination(),
//        control: new SwiperControl(),
        loop: false,
        onTap: (index) {
          if(index == list.length-1){
//            Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
            //跳转并关闭先前所有页面
            Navigator.pushAndRemoveUntil(
              context,
              new MaterialPageRoute(builder: (context) => new Main()),
                  (route) => route == null,
            );

          }
        },
      ),
    );


  }

}