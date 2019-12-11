import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyChip extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyChopState();

}

class MyChopState extends State<MyChip>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Chip(
          avatar: Icon(
              Icons.add_location,
              color: Colors.lightBlue
          ),
          label: Text('北京'),
          deleteIcon: Icon(Icons.delete_forever,color: Colors.red,),
            deleteButtonTooltipMessage: "删除该条",
            onDeleted: (){
              Fluttertoast.showToast(msg: '111');
            }
        ),
      ),
    );
  }

}