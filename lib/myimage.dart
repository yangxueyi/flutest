import 'package:flutter/material.dart';

class Invest extends StatefulWidget {
  @override
  createState() => MyInvestState();
}

class MyInvestState extends State<Invest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Text('圆形image'),
        ),
      ),
      body: Center(

          child: Column(
            children: <Widget>[
          //使用边框来实现图片圆角：
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(
                    'https://avatar.csdn.net/8/9/A/3_chenlove1.jpg'),
                fit: BoxFit.fill, //设置填充整个Container
              ),
//              border: new Border.all(color: Color(0xFFFFFF00), width: 0.5),
              // 边色与边宽度
//              color: Color(0xFF9E9E9E),
              shape: BoxShape.circle, // 默认值也是矩形
            ),
          ),

          //使用CircleAvatar来实现圆形图片：
              Padding(
                  padding:EdgeInsets.only(
                    bottom: 20.0
                  ),
                child:  CircleAvatar(
                  backgroundImage:
                  NetworkImage('https://avatar.csdn.net/8/9/A/3_chenlove1.jpg'),
                  radius: 50.0,
                ),
              ),
          //使用裁剪实现圆形图片：
          ClipOval(
            child: Image.network(
              'https://avatar.csdn.net/8/9/A/3_chenlove1.jpg',
              scale: 1.0,
            ),
          ),

          //圆角
          Padding(
            padding:EdgeInsets.all( 20.0),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: new Image.network(
              'https://avatar.csdn.net/8/9/A/3_chenlove1.jpg',),
          ),
          ),
          Image.network('https://avatar.csdn.net/8/9/A/3_chenlove1.jpg')
        ],
      )),
    );
  }
}
