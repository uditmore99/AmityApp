// import 'package:flutter/material.dart';
//
// class ContactsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Contacts Page", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
//       ),
//     );
//   }
// }
//this is POMODORO
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';
import 'var.dart' as globals;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Pomodoro(),
  ));
}

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  double percent = 0;
  static int TimeInMinutes = 25;
  int TimeInSeconds = TimeInMinutes * 60;
  late Timer timer;

  _StartTimer() {
    TimeInMinutes = 25;
    int Time = TimeInMinutes * 60;
    double SecPercent = (Time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (Time > 0) {
          Time--;
          if (Time % 60 == 0) {
            TimeInMinutes--;
          }
          if (Time % SecPercent == 0) {
            if (percent < 1) {
              percent += 0.01;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          TimeInMinutes = 25;
          timer.cancel();
        }

        if ( double.parse((percent).toStringAsFixed(2)) == 1)
        {
          globals.amityTokenBalance = globals.amityTokenBalance +10;
          print( globals.amityTokenBalance);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purpleAccent],
                    begin: FractionalOffset(0.5, 1))),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Pomodoro Timer!",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                Expanded(
                  child: CircularPercentIndicator(
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 120.0,
                    lineWidth: 10.0,
                    progressColor: Colors.white,
                    center: Text(
                      "$TimeInMinutes",
                      style: TextStyle(color: Colors.white, fontSize: 80),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Focus for",
                                          style: TextStyle(
                                            fontSize: 27.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "25 minutes",
                                          style: TextStyle(fontSize: 30.0),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Take break for",
                                          style: TextStyle(
                                            fontSize: 27.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "5 minutes",
                                          style: TextStyle(fontSize: 30.0),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 28.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    _StartTimer();
                                  },
                                  icon: Icon(Icons.add_alarm),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(200, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    primary: Colors.deepPurple,
                                  ),
                                  label: Text(
                                    'Start!',
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
