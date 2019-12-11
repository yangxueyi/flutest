import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrCode extends StatefulWidget {
  @override
  createState() => MyQrCodeState();
}

class MyQrCodeState extends State<MyQrCode> {

  bool isShowQr = true;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('二维码'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
                child: Text('生成二维码'),
                onPressed: () {
                  setState(() {
                    isShowQr = false;
                  });
                }),
            Offstage(//控制控件的显示隐藏的控件
                offstage: isShowQr,// 当offstage为true，控件隐藏； 当offstage为false，显示；
                child:   Center(
                  child: QrImage(
                    data: '我是二维码',
                    size: 200.0,
                    foregroundColor: Colors.blue,//二维码颜色
                  ),
                )
            )

          ],
        ),
      );
  }

  _getQrCode() {
    if(isShowQr){
      QrImage(
        data: '我是二维码',
        size: 200.0,
      );
    }
  }
}
