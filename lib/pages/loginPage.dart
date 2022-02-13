import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/utils/routes.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          reverse: false,
          child: Column(
            children: [
              // Expanded(
              // child: ListView.builder(
              // itemCount: 30,
              //   reverse: true,
              //   itemBuilder: (context, i) => ListTile(title: Text('Item $i')),
              // ),),
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                        //Do something with the user input.
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      onPressed: ()async {

                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, MyRoute.homeRoute);
                          }
                        } catch (e) {
                          //Handle exception here..
                          print(e);
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Don't have an account?"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate back to first screen when tapped.
                        Navigator.pushNamed(context, MyRoute.registerRoute);
                      },
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      child: const Text('Signup Now!'),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),),],
                ),
              )
            ],
          ),
        ));
  }
}
