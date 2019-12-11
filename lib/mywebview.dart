import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyWebViewState();
}

class MyWebViewState extends State<MyWebView> {
  //定义一个私有的WebViewController。视图监听器，用来监听返回按钮与顶部返回按钮
  WebViewController _controller;
  //定义一个变量控制进度条是否显示
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        //监听返回按钮
        child: Scaffold(
          appBar: AppBar(
            title: Text('webview'),
          ),
          body: Stack(//Stack 相当于framelayout
            children: <Widget>[
              WebView(
                initialUrl: 'https://test-h5.jajaying.com/apph5/info_menu.html',
                onWebViewCreated: (WebViewController webViewController) {
                  //将webview的视图监听器赋值给自定义的视图监听器
                  _controller = webViewController;
                },
                onPageFinished: (String value){
                  // 返回当前url
//              print(value);
                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
              _loading()
            ],
          )
        ),


        onWillPop: _requestPop);
  }

  Future<bool> _requestPop() {
    _onBack();
    return new Future.value(false);
  }

  //返回键与返回按钮
  _onBack() {
    //使用视图监听器设置按钮按钮
    _controller.canGoBack().then((value) {
      if (value) {
        _controller.goBack();
      } else {
         Navigator.pop(context);
      }
    });
  }

  //添加加载进度条
  _loading () {
    return _isLoading == true ? Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ) : Text('');
  }
}
