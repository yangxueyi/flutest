import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  @override
  createState() => MyTimerState();
}

class MyTimerState extends State<MyTimer> {
  Timer _countdownTimer;
  String _codeCountdownStr = '获取验证码';
  int _countdownNum = 60;
  Color textColor = Color(0xFF999999);
  Color btnColor = Color(0xFFDDDDDD);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('倒计时'),
        ),
      ),
      body: Center(
        child: FlatButton(
            child: Text(
                _codeCountdownStr,
                style: TextStyle(
                  color: textColor
              ),
            ),
            onPressed: () {
              reGetCountdown();
            },
             color: btnColor,
            //圆角矩形
            shape:new StadiumBorder(side: new BorderSide(style: BorderStyle.solid,color: Colors.transparent)),
            ),
      ),
    );
  }

  //倒计时
  void reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '已发送(${_countdownNum--})';
      textColor = Colors.white;
      btnColor = Color(0xFFf1523c);
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '已发送(${_countdownNum--})';
            textColor = Colors.white;
          } else {
            _codeCountdownStr = '重新获取';
            _countdownNum = 60;
            btnColor = Color(0xFFf1523c);
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }

  // 不要忘记在这里释放掉Timer
  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
}
