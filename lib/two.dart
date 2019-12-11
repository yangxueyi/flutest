import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'edittext.dart';
import 'myanimation.dart';
import 'mycheckbox.dart';
import 'mychip.dart';
import 'mydatepicker.dart';
import 'mydialog.dart';
import 'myslider.dart';
import 'mywebview.dart';

//
//class Two extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: MyTwo(),
//    );
//  }
//
//}

class MyTwo extends StatefulWidget {
  @override
  createState() => MyTwoState();
}

class MyTwoState extends State<MyTwo> with SingleTickerProviderStateMixin {
  TabController controller;
  var tabs = <Tab>[];
  var widgets = [
    MyTextField(),
    MyCheckBox(),
    MySlider(),
    MyDatePicker(),
    MyDialog(),
    MyChip(),
    MyAnimation(),
    MyWebView()
  ];

  @override
  void initState() {
    super.initState();
    tabs = [
      Tab(text: 'textfield'),
      Tab(text: 'checkbox'),
      Tab(text: 'slider'),
      Tab(text: 'datePicker'),
      Tab(text: 'myDialog'),
      Tab(text: 'myChip'),
      Tab(text: 'myanimation'),
      Tab(text: 'mywebview')
    ];
    //定义一个控制器
    controller =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
//        leading: Text(''),
//          automaticallyImplyLeading: false, //设置没有返回按钮
        title: Center(
          child: Text('demo'),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.home),
//          child: Text("abc"),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: Text("热度"),
                  value: "hot",
                ),
                PopupMenuItem<String>(
                  child: Text("最新"),
                  value: "new",
                ),
              ];
            },
            onSelected: (String value) {
              Fluttertoast.showToast(msg: value);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: TabBar(
              controller: controller,
              //配置控制器
              tabs: tabs,
              isScrollable: true,
              //是否可以滚动
              //下划线的设置
              indicatorWeight: 2.0,
              indicatorColor: Colors.red,
//                  indicatorPadding:  EdgeInsets.only(left: 16.0, right: 16.0),
              indicatorSize: TabBarIndicatorSize.label,
              // //设置下划线与文字等宽

              //tab的设置
              labelColor: Colors.limeAccent,
              labelPadding: EdgeInsets.only(left: 16.0, right: 16.0),
              unselectedLabelColor: Colors.purple,
              labelStyle: TextStyle(fontSize: 15.0),
              unselectedLabelStyle: TextStyle(fontSize: 11.0),
            ),
          ),
          /*Container(
                height: 200.0,
                child: TabBarView(
                    controller: controller, //配置控制器
                    children: tabs
                        .map((Tab tab) => Container(
                      child: Center(
                        child: Text(tab.text),
                      ),
                    ))
                        .toList()),
              )*/

          Expanded(
            flex: 1,
            child: TabBarView(
                controller: controller, //配置控制器
                children: widgets),
          )
        ],
      ),
    );
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
