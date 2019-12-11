import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget{
  @override
  createState() => MyAnimationState();

}

class MyAnimationState extends State<MyAnimation> with TickerProviderStateMixin{
  Animation<double>  animation;
  AnimationController  controller;
  CurvedAnimation  curve;
  bool isForward = false;

  @override
  void initState() {
    super.initState();
    //动画的时长
    controller = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this);
    //插值器
    curve = CurvedAnimation(parent: controller, curve: Curves.easeInOutBack);
    //控制动画的位置
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('11111'),
              onPressed: (){
                isForward ? controller.reverse() : controller.forward();
                isForward = !isForward;
              }
          ),
        //显隐性
        FadeTransition(opacity: animation, child: FlutterLogo(size: 50.0)),
        // 缩放
        ScaleTransition(scale: animation, child: FlutterLogo(size: 50.0)),
        // 旋转
        RotationTransition(turns: animation,child: FlutterLogo(size: 50.0)),


        //平移
        Transform.translate(offset: Offset(300.0 * curve.value, 0.0), child: FlutterLogo(size: 50.0)),
        // 旋转
        Transform.rotate(angle: curve.value * 6.0, child: FlutterLogo(size: 50.0)),
        //缩放
          Transform.scale(scale: curve.value,child: FlutterLogo(size: 50.0)),

        //透明度(显隐性）
        AnimatedOpacity(opacity: animation.value, duration: Duration(milliseconds: 0), child: FlutterLogo(size: 50.0))

    ],
      )

    );
  }

}
