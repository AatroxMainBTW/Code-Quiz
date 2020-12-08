import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quizz_app/screens/home.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();

}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();
  Timer(Duration(seconds : 3),(){
    Navigator.pushReplacementNamed(context, '/home');
  });
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.grey[850],
        body: Center(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Code Quiz",
                style:
                TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "SpaceMono"
                ),
              ),
              SizedBox(height: 30,),
              SpinKitFadingFour(
                color: Colors.orange,
                size: 50.0,
              ),
              SizedBox(height: 50,),
              Text(
                "Tap it learn it",
                style:
                TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "SpaceMono"
                ),
              ),
            ],
          )


        ),
      ),
    );
  }
}
