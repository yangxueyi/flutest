import 'package:flutter/material.dart';

class MySlider extends StatefulWidget{
  @override
  createState() => MySliderState();

}

class MySliderState extends State<MySlider>{

  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slider(
          value: value,
          label: '$value',
          min: 0.0,
          max: 100.0,
          divisions: 100,
          activeColor: Colors.green,
          inactiveColor: Colors.red,
          onChanged: (val){
            setState(() {
              value = val.floorToDouble();//转化成double
            });
          },
        ),
      ),
    );
  }

}