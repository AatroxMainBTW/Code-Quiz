import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:quizz_app/Materials/modbutton.dart';

class getjson extends StatelessWidget {
  String name;
  String assettoload;
  Map data;


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    name = data['name'];
      print(name);
      if (name == "Python") {
        assettoload = "assets/python.json";
      } else if (name == "Java") {
        assettoload = "assets/java.json";
      } else if (name == "Javascript") {
        assettoload = "assets/js.json";
      } else if (name == "C++") {
        assettoload = "assets/cplus.json";
      }

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(assettoload),
      builder: (context,snapshot){
        var mydata = json.decode(snapshot.data.toString());
        print(mydata);
        if(mydata == null){
          return Scaffold(
              body: Center(
                child: Text("Loading"),
              ),
          );
        }else{
          return quizactivity(mydata: mydata,);
        }
      },
    );
  }
}

class quizactivity extends StatefulWidget {
  var mydata;
  quizactivity({this.mydata});
  @override
  _quizactivityState createState() => _quizactivityState(mydata: mydata);
}

class _quizactivityState extends State<quizactivity> {
  List mydata;
  _quizactivityState({this.mydata});
  bool validation;


  int nb = 1;
  int points = 0;

  void nextq(){
    setState(() {
      if(nb < 10){
        nb=nb+1;
        print(nb);
      }else{
        Navigator.pushReplacementNamed(context, '/result', arguments: {
          'points': points,
        });
      }
    });
  }


  void checkresponses(String key){
    if(mydata[2][nb.toString()] == mydata[1][nb.toString()][key]){
      validation = true;
      print(mydata[2]['1']);
      points = points+1;

      //print(points);
    } else{
      validation = false;

      print(points);
    }
    Timer(Duration(seconds: 2),nextq);
  }



  Widget ModifyButton(String key){
    return MaterialButton(
      onPressed: (){
        checkresponses(key);
      },
      splashColor: Colors.grey[100],
      minWidth: 300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(mydata[1][nb.toString()][key]
        ,style: TextStyle(
            color: Colors.white,
            fontFamily: "SpaceMono",
            fontSize: 16.0
        ),),
        color: Colors.blue[900],
    );
  }


  // ignore: non_constant_identifier_names
  Widget TF(){
    if(validation==true){
      return Text("True",style:TextStyle(
      color: Colors.green,
          fontSize: 30,
          fontFamily: "SpaceMono",
          fontWeight: FontWeight.bold
      ));
    } else if(validation==false){
      return Text("False",style:TextStyle(
          color: Colors.redAccent[700],
          fontSize: 30,
          fontFamily: "SpaceMono",
          fontWeight: FontWeight.bold
      ));

    }else{
      return Text("");
    }
  }



  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text('Code Quiz'),
              content: Text('Can\'t\' go back u MUST Finish this first'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  },
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Code quiz",style: TextStyle(fontFamily: "SpaceMono"),),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey[850],
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(

                        decoration: BoxDecoration(
                        color: Colors.lightBlue[900],borderRadius: BorderRadius.circular(20),

                      ),
                      width: 150,
                      alignment: Alignment.center,
                      child: Text("Question",style: TextStyle(
                        fontSize: 20,fontFamily: "SpaceMono",color: Colors.grey[50],letterSpacing: 1.0
                      ),),),
                      SizedBox(height: 15,),
                      Text(mydata[0][nb.toString()],style: TextStyle(
                        fontSize: 20,fontFamily: "SpaceMono",color: Colors.white
                      ),)
                    ],
                  ),
                ),
              ),
              Divider(
                height: 10.0,
                color: Colors.grey[400],
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.lightBlue[900],borderRadius: BorderRadius.circular(20),

                        ),
                        width: 150,
                        alignment: Alignment.center,
                        child: Text("Responses",style: TextStyle(
                            fontSize: 20,fontFamily: "SpaceMono",color: Colors.grey[50],letterSpacing: 1.0
                        ),),),
                      SizedBox(height: 15,),
                      ModifyButton("a"),
                      ModifyButton("b",),
                      ModifyButton("c",),
                      ModifyButton("d",),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 10.0,
                color: Colors.grey[400],
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child:TF()
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


