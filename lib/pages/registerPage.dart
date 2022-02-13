import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/utils/routes.dart';

class RegisterPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String name = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
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
                      child: Text("submit"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      onPressed: ()async {

                        try {
                          final user = await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, MyRoute.loginRoute);
                          }
                        } catch (e) {
                          //Handle exception here..
                          print(e);
                        }
                      },
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //
                    //       ElevatedButton(
                    //           child: Text("Register"),
                    //           style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //           onPressed: () async {
                    //             try {
                    //               final newUser = await _auth.createUserWithEmailAndPassword(
                    //                   email: email, password: password);
                    //               if (newUser != null) {
                    //                 Navigator.pushNamed(context, MyRoute.loginRoute);
                    //               }
                    //             } catch (e) {
                    //               //Handle exception here..
                    //               print(e);
                    //             }
                    //           }
                    //
                    //       ),
                    //     ],
                    //   ),
                    //
                    // )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
