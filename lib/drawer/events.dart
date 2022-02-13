import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventsPage(),
    );
  }
}


class EventsPage extends StatefulWidget {
  @override
  _EventsPage createState() => _EventsPage();
}

class _EventsPage extends State<EventsPage> with TickerProviderStateMixin{
  late AnimationController _breathingController;
  var _breathe =0.0;

  @override
  void initState() {
    super.initState();

    _breathingController = AnimationController(
        vsync: this, duration: Duration(seconds: 4));
    _breathingController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _breathingController.reverse();

      } else if (status == AnimationStatus.dismissed){
        _breathingController.forward();
      }
    });

    _breathingController.addListener(() {
      setState(() {
        _breathe =_breathingController.value;
      });
    });
    _breathingController.forward();

  }


  @override
  Widget build(BuildContext context) {
    final size = 170.0 -120.0 * _breathe;
    return Scaffold(
      body:Center(
        child: Container(
          height: size,
          width:size,
          child: Material(
            borderRadius: BorderRadius.circular(size),
            color: Colors.blueAccent,



          ),
        ),
      ),

    );
  }


}

