import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';



//刷新状态枚举
enum LoadingStatus{
  //正在加载中
  STATUS_LOADING,
  //加载完成
  STATUS_OVER,
  //空闲
  STATUS_IDEL

}

class MyListView extends StatefulWidget{
  @override
  createState() => MyListViewState();

}

class MyListViewState extends State<MyListView>{

  //限制一滑动到最下方就刷新，在刷新数据 及 刷新完之后改变状态
  static var loadStatus = LoadingStatus.STATUS_IDEL;
  List list  = new List();
  int pageCount = 15;
  //定义上拉加载默认显示
  String loadText = '加载中...';
  //判断是不是最后一条，如果是就不显示进度条
  bool isShowLoading = false;

  //第一次进来是否显示加载进度条
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey();

  //定义listview的滑动监听
  ScrollController _scrollController = ScrollController();

  //定义两个padding方法
  Widget _pada(Widget widget,var value){
    return Padding(padding: EdgeInsets.all(value),child: widget,);
  }
  Widget _pad(Widget widget,{left, top, right, bottom}){
    return Padding(padding: EdgeInsets.fromLTRB(left ??= 0.0, top ??= 0.0, right ??= 0.0, bottom ??= 0.0),child: widget,);
  }

  //加载中的布局
  Widget _loadingView() {
    var loadingTS = TextStyle(color: Colors.blue, fontSize: 16);
    var loadingText = _pad(Text(loadText, style: loadingTS), left: 20.0);
    var loadingIndicator = new Visibility(
//        visible: loadStatus == LoadingStatus.STATUS_LOADING ? true : false,
        child: SizedBox(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue)),
          width: 20.0,
          height: 20.0,
        ));

    //上垃圾在进度条的样式
    return _pad(
        Row(
          children: <Widget>[loadingIndicator, loadingText],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        top: 20.0,
        bottom: 20.0);
  }


  @override
  void initState() {

    //第一次显示加载进度条
    _isShowRefresh();
    //初始化数据
    for(int i = 1 ; i < pageCount; i++){
      list.add('第$i条数据');
    }
    //设置listview的监听
    _scrollController.addListener((){
      //判断当滑动到最底部的时候，加载下一页
      /*
      * pixels:获得当前位置的像素值
      * maxScrollExtent:滚动的最大范围
      */
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('ListView'),
        ),
      ),
      body: RefreshIndicator(
        //关联RefreshIndicator
          key: _refreshIndicatorKey,
          child: ListView.builder(
              itemCount: list.length +1,
              itemBuilder: (context,index){
                if (index == list.length) {
                  if(isShowLoading){
                    return Container(width: 0,);
                  }else {
                    return _loadingView();
                  }
                }else {
                  return new Column(
                    children: <Widget>[
                    ListTile(
                      title: _pad(Text(list[index]), top: 20.0, bottom: 20.0),
                      onTap: (){
                        toast(index);
                      },
                    ),
                    new Divider(height: 0.2)
                  ],
                  );
                }
              },

              controller: _scrollController,

          ),
          onRefresh: _doRefresh
      ),
    );
  }

  void toast(int i){
    Fluttertoast.showToast(msg: '第$i条');

  }

  //下拉刷新
  Future<void> _doRefresh () async{

    await Future<Null>.delayed(Duration(seconds: 2),(){

      /**
       *
       * mounted
      * 判断当前页面是否存在于构件树中，防止内存泄露
      * true 表示当前页面挂在到构件树中
      *false 时未挂载当前页面
      */
      if(mounted){
        setState(() {
          list.clear();
          for(int i = 1; i < pageCount; i++){
            list.add('我是刷新后的第$i条');
          }
          isShowLoading = false;
          return null;
        });
      }



    });

  }

  //加载下一页数据
  Future _getMoreData() async{
    if(loadStatus == LoadingStatus.STATUS_IDEL){
      //先设置状态，防止往下拉就直接加载数据
      setState(() {
        loadStatus = LoadingStatus.STATUS_LOADING;
      });
    }
    //加载更多的list
    List moreList;
    //做一个限制
    if(list.length<45){
      moreList = await Future.delayed(Duration(seconds: 2),() async {
        return List.generate(pageCount, (i){
          return '新增数据' + (list.length + i + 1).toString();
        });
      });

    }

    /**
     *
     * mounted
     * 判断当前页面是否存在于构件树中，防止内存泄露
     * true 表示当前页面挂在到构件树中
     *false 时未挂载当前页面
     */
    if(!mounted){
      return;
    }

    setState(() {
      if(list.length < 45){
        list.addAll(moreList);
        loadStatus = LoadingStatus.STATUS_IDEL;
        loadText = '加载中...';
        isShowLoading = false;
      }else{
        loadStatus = LoadingStatus.STATUS_OVER;
//        loadText = '加载完毕';
        isShowLoading = true;
      }
    });


  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }




  void _isShowRefresh(){
    // 这里使用延时操作是由于在执行刷新操作时_refreshIndicatorKey还未与RefreshIndicator关联
    Future.delayed(Duration(seconds: 0),(){
      _refreshIndicatorKey.currentState.show();
    });
  }


}