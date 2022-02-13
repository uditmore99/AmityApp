import 'package:flutter/material.dart';
import 'package:project1/pages/homePage.dart';
import 'package:project1/pages/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/pages/registerPage.dart';
import 'package:project1/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch:Colors.deepPurple,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute:MyRoute.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoute.homeRoute : (context) => HomePage(),
        // "/login" : (context) => LoginPage(),
        MyRoute.loginRoute : (context) => LoginPage(),
        MyRoute.registerRoute : (context) => RegisterPage(),
      },
    );
  }
}
