import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Quote> quoteFunction() async {
  final response = await http
      .get(Uri.parse('https://zenquotes.io/api/random/'));

  if (response.statusCode == 200) {
    print(Quote.fromJson(jsonDecode(response.body)[0]));
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quote.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Quote {
  final String q;
  final String a;
  final String h;

  const Quote({
    required this.q,
    required this.a,
    required this.h,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      q: json['q'],
      a: json['a'],
      h: json['h'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: Color(0xFF6c5ed0),
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.white),
      home: const MyHomePage(title: 'AMITY1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Quote> quoteOfDay;

  @override
  void initState() {
    super.initState();
    quoteOfDay = quoteFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daily Quotes'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(50),
              height: 300,
              width: 300,
              child: FutureBuilder<Quote>(
                future: quoteFunction(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.q + "\n - " + snapshot.data!.a ,style: TextStyle(
                      fontSize: 25, color: Colors.white
                    ),);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}',style: TextStyle(
                        fontSize: 25, color: Colors.white));
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF6c5ed0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 3.0, //extend the shadow
                    offset: Offset(
                      9.0, // Move to right 10  horizontally
                      9.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(30)),

                //color: Colors.blue,
              ),
            ),
          ],
        ));
  }
}
