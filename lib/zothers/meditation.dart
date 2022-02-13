import 'package:flutter/material.dart';
void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigate back to first screen when tapped.
              // Navigator.pushNamed(context, MyRoute.registerRoute);
            },
            style: TextButton.styleFrom(minimumSize: Size(150, 40),),
            child: const Text('Signup Now!'),),
        ],
      ),
    );
  }
}
