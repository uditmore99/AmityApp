import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp(myTimer());
}

class myTimer extends StatefulWidget {
  const myTimer({Key? key}) : super(key: key);

  @override
  _myTimerState createState() => _myTimerState();
}

class _myTimerState extends State<myTimer> {
  String greeting = "Hello";
  @override
  void initState{}(
    super.initState();
    Timer(Duration(minutes:1),(){
      SetSt
})
)
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("Timer app"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(greeting, style: TextStyle(fontSize:30),)
            ],
          ),
        ),
      )
    );
  }
}
