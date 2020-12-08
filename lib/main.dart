import 'package:flutter/material.dart';
import 'package:quizz_app/Materials/loading.dart';
import 'package:quizz_app/screens/gamerules.dart';
import 'package:quizz_app/screens/home.dart';
import 'package:quizz_app/screens/quizzpage.dart';
import 'package:quizz_app/screens/resultpage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) =>Loading(),
      '/home': (context) =>Home(),
      '/quizz':(context)=>getjson(),
      '/result':(context)=>Result(),
      '/gr':(context)=>GameRules()
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
    );
  }
}
