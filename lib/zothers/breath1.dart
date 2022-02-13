import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Sample()));
}

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Parent Widget rebuild");

    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          ChangingColor(),
        ],
      ),
    );
  }
}

class ChangingColor extends StatefulWidget {
  @override
  _ChangingColorState createState() => _ChangingColorState();
}

class _ChangingColorState extends State<ChangingColor> {
  late Timer _timer;
  late Color _color;
  List<Color> arrColors = [Colors.blue, Colors.red, Colors.green, Colors.yellow] ;
  int _pos =0;
  List<int> arrSeconds = [2,5,1,8]; //here I set array for seconds

  @override
  void initState() {


    super.initState();
    doSomething();
  }

  @override
  Widget build(BuildContext context) {
    print("Child Widget rebuild");

    return Container(
      height: 50,
      width: 50,
      color: arrColors[_pos],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    // _timer = null;
    super.dispose();
  }

  Future<void> doSomething() async {
    var second=0;
    var colorCount=1;
    var count=0;
    var totalList=[];
    for(var e in arrSeconds){
      count=count+e;
      totalList.add(count);
    }
    print(totalList);
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if(totalList[totalList.length-1]==second){



        _timer.cancel();

        setState(() {
          _pos=0;
        });
        doSomething();
      }else{
        if(totalList.contains(second)){
          setState(() {

            _pos =colorCount;
            colorCount++;
            print(second);
          });
        }
      }


      second++;
    });
  }



}