import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Center(
      //   children: [Text("Dashboard Page")]
      // ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {

                  // final stopWatchTimer = StopWatchTimer(
                  //   mode: StopWatchMode.countUp,
                  //   onChange: (value) => print('onChange $value'),
                  //   onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
                  //   onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
                  // );
                  //
                  // // Navigate back to first screen when tapped.
                  // // Navigator.pushNamed(context, MyRoute.registerRoute);
                },
                style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(50),
                  height: 300,
                  width: 300,
                  child: Text('Use drawer to explore!'),

                ),
            ),
            )],
        ),
      )
    );
  }
}
