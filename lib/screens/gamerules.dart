import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/Materials/customlisttile.dart';
class GameRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Code quiz",style: TextStyle(fontFamily: "SpaceMono"),),
    centerTitle: true,
    ),drawer: Drawer(
    child: ListView(
    children: <Widget>[
    new UserAccountsDrawerHeader(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: <Color>[Colors.blue, Colors.blue[900]])),
    accountName: new Text("Made By Fouzi Hammouda \"Dazai"""),
    accountEmail: new Text("https://github.com/AatroxMainBTW"),
    currentAccountPicture: new CircleAvatar(
    backgroundImage: AssetImage("assets/tenor.gif"),
    ),

    ),
    CustomListTile(Icons.home, 'Home', () => {
    Navigator.pushReplacementNamed(context, '/home')
    }),
    CustomListTile(Icons.sports_esports, 'Game Rules', () => {
    Navigator.pushReplacementNamed(context, '/gr')
    }),

    ],

    ),
      ),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Rules :",style: TextStyle(
            fontSize: 25,
            fontFamily: "SpaceMono",
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 25,),
          Text("1- Select one field java python etc...",style: TextStyle(
              fontSize: 20,
              fontFamily: "SpaceMono",
              color: Colors.grey[100]
          ),),
          SizedBox(height: 15,),
          Text("2- Answer the questions you will get notified if you have true of false in the next question",style: TextStyle(
              fontSize: 20,
              fontFamily: "SpaceMono",
              color: Colors.grey[100]
          ),),
          SizedBox(height: 15,),
          Text("3- Enjoy",style: TextStyle(
              fontSize: 20,
              fontFamily: "SpaceMono",
              color: Colors.grey[100]
          ),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/tenor.gif"),
              )
            ],
          )
        ],
      ),
    ),)
    );
  }}
