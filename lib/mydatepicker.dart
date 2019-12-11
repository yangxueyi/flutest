import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class MyDatePicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyDatePickerState();

}

class MyDatePickerState extends State<MyDatePicker>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('日期选择'),
              onPressed:(){
                _showDatePicker();
              }
          ),
          RaisedButton(
              child: Text('时间选择'),
              onPressed:() => _showTimePicker()
          )

        ],
      ),
    );
  }

  void _showDatePicker() async{
//        Locale myLocale = Localizations.localeOf(context);
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2020),
//        locale: myLocale
    );
    setState(() {
      if(picker!=null) {
        Fluttertoast.showToast(msg: picker.toString());
      }
    });
  }

  void _showTimePicker() async{
    var picker = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );
    setState(() {
      if(picker!=null) {
        Fluttertoast.showToast(msg: picker.toString());
      }
    });
  }

}