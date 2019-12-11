import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'constans/ApiConstans.dart';
import 'utils/AppInfoUtils.dart';
import 'utils/DeviceInfoUtils.dart';
import 'utils/HttpUtil.dart';

import 'bean/loan_bean_entity.dart';
import 'bean/load_detail_entity.dart';

class MyHttp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHttpState();
}

class MyHttpState extends State<MyHttp> {
  DeviceInfoUtils deviceInfoUtils;
  AppInfoUtils appInfoUtils;

  String textStr = '';
  bool isLoading;

  Future upData;

//  LoanBeanEntity loanBeanEntity;


  @override
  void initState() {
    super.initState();

    //初始化工具類
    deviceInfoUtils = DeviceInfoUtils.getInstance();
    appInfoUtils = AppInfoUtils.getInstance();

  }

  @override
  Widget build(BuildContext context) {

    HttpClient httpClient = HttpClient();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('myHttp'),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text(
                '获取数据',
              ),
              onPressed: () {
                _onClick();
              }),
          FutureBuilder(
              future: upData,
              // ignore: missing_return
              builder: (context, snap) {
                print(snap.data);
                switch (snap.connectionState) {
                  case ConnectionState.active:
                    return Text('active');
                  case ConnectionState.waiting:
                    return _loading();
                  case ConnectionState.none:
                    return Text('none');
                  case ConnectionState.done:
                    if (snap.hasError) {
                      return Text(snap.error.toString()+"----========------");
                    }
                    //若执行正常完成
                      Map<String, dynamic> map = jsonDecode(snap.data.toString());
                    LoadDetailEntity loanBeanEntity = LoadDetailEntity.fromJson(map);
                      return Expanded( //权重
                        flex: 1,
                        child: Text(loanBeanEntity.businessObject.loanTitle),
                      );

                  default:
                    return Text('还没有开始网络请求');

                }
              }),

          /*Expanded(//权重
                child:
                Stack(//类似于framlayout
                  children: <Widget>[
                SingleChildScrollView(//滑动控件
                //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
                scrollDirection: Axis.vertical,
                  //true 滑动到底部
                  reverse: true,
//              padding: EdgeInsets.all(20),
                  ////滑动到底部回弹效果
                  physics: BouncingScrollPhysics(),
                  child: Text(textStr),

                ),
              _loading()

                    ]
                )
              )*/
        ],
      )),
    );
  }

  _onClick(){
    setState(() {
       upData = _UpData();
    });
  }

  Future _UpData() async {
    Map<String, String> paras = {
      "loanId": "20190723C128440000000000000001FU",
    };
    var post = HttpUtil.post(ApiConstan.queryLoanDetail, data: paras,
//        success: (loadData){
//           loanBeanEntity = LoanBeanEntity.fromJson(loadData);
//          print(loanBeanEntity.loanId);
//        },
        error: (errorMsg) {
      print('------' + errorMsg);
    });
    print('--***----' + post.toString());
    return post;
  }

  //进度条
  _loading() {
    return  Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
