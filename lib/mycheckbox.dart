import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class MyCheckBox extends StatefulWidget{
  @override
  createState() => MyCheckBoxState();
}

class MyCheckBoxState extends State<MyCheckBox>{

  bool isCheck = false;
  bool isCheck1 = false;
  bool isCheck2 = false;
  var groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Column(
         children: <Widget>[
           Checkbox(
             value: isCheck,
             activeColor: Colors.blue,
             onChanged: (bool chexk){
               // val 是布尔值
               setState(() {
                 isCheck = chexk;
               });
             },
           ),

           CheckboxListTile(
               value: isCheck1,
                secondary: Icon(Icons.check),
               title: Text('java'),
               onChanged: (bool check){
                 setState(() {
                   isCheck1 = check;
                 });
               }
           ),
            Center(
             child:  CheckboxListTile(
                 value: isCheck2,
                 title:  Text('张晓'),
                 controlAffinity: ListTileControlAffinity.platform,
                 onChanged: (bool){
                   setState(() {
                     isCheck2=bool;
                   });
                 }),
           ),
            Center(
             child:  CheckboxListTile(
                 value: isCheck,
                 title:  Text('张晓'),
                 controlAffinity: ListTileControlAffinity.platform,
                 onChanged: (bool){
                   setState(() {
                     isCheck=bool;
                   });
                 }),
           ),

            RadioListTile(
               value: 1,
               groupValue: groupValue,
               title:  Text('开'),
               onChanged: (int v){
                 setState(() {
                   groupValue = v;
                 });
               }),
            RadioListTile(
               value: 2,
               groupValue: groupValue,
               title:  Text('关'),
               onChanged: (int v){
                 setState(() {
                   groupValue = v;
                 });
               }),
            RadioListTile(
               value: 3,
               groupValue: groupValue,
               title:  Text('不开不关'),
               onChanged: (int v){
                 setState(() {
                   groupValue = v;
                 });
               }),

           RaisedButton(
              child: Text('button'),
               onPressed: (){
                 Fluttertoast.showToast(msg: 'isCheck===$isCheck    groupValue===$groupValue');
               }
           )

         ],
       ),
    );
  }

}
