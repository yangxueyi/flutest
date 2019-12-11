import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 添加

import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'myimage.dart';
import 'yxy.dart';
import 'mylistview.dart';
import 'myHttp.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),

      // 添加国际化
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = [Home(), Invest(), MyListView(), MyHttp()];
  int bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            _getDrawerHeader(),
            _getListItem('haha', Icons.map),
            _getListItem('phone', Icons.call),
            _getListItem('set', Icons.settings)
          ],
        ),
      ),
      body: list[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.print), title: Text('主页')),
          BottomNavigationBarItem(icon: Icon(Icons.print), title: Text('图片')),
          BottomNavigationBarItem(icon: Icon(Icons.print), title: Text('list')),
          BottomNavigationBarItem(icon: Icon(Icons.print), title: Text('http')),
          /*  BottomNavigationBarItem(
            icon: Icon(Icons.print),
            title: Text('web')
        )*/
        ],
        currentIndex: bottomIndex,
        onTap: (int index) {
          setState(() {
            bottomIndex = index;
          });
        },
        selectedItemColor: Color(0xFFf1523c),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, //超过三个，文字不显示
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context) => new MyTwo()));
            _getSharedPreferencesData();
          }),
    );
  }

  _getSharedPreferencesData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Fluttertoast.showToast(
      msg: sp.get('count'),
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
    );
  }

  Widget _getDrawerHeader() {
    return DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        child: Column(
          children: <Widget>[
            Icon(Icons.access_time),
            Text('drawer'),
          ],
        ));
  }

  Widget _getListItem(String str, IconData icon) {
    return Container(
//      padding: EdgeInsets.only(left: 10.0,top: 10.0),
      child: ListTile(
        title: Text(str),
        trailing: Icon(icon),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
//          backgroundImage: NetworkImage(horseUrl),
        ),
        subtitle: Text('subtitle'),
        onTap: () {
          Fluttertoast.showToast(msg: str);
        },
      ),
    );
  }
}
