
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz_app/Materials/customlisttile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "assets/java.png","assets/python.png","assets/cplus.png","assets/js.png"
  ];
  List<String> text = [
    "Created in: May 1995",
    "Created in: December 1989",
    "Created in: December 1995",
    "Created in: 1985"
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
    Widget CustomCard(String name,String image,String txt){
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap:(){

            print(name);
            Navigator.pushReplacementNamed(context, '/quizz', arguments: {
              'name': name,
            });

          },
          child: Wrap(
              children:<Widget>[
                Material(
                  color: Colors.blue[900],
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    child: Row(

                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(15,5,5,5),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(200.0),
                                child: Container(

                                  child: ClipOval(

                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 20,

                                      child: Image(

                                        image:  AssetImage(

                                          image,

                                        ),


                                      ) ,

                                    ),
                                  ),
                                ),
                              ),
                            ),



                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(name,style: TextStyle(
                                  color: Colors.white,fontSize: 15,fontFamily: "SpaceMono",fontWeight: FontWeight.bold
                              ),
                              ),

                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(txt,style: TextStyle(
                                  fontFamily: "SpaceMono", fontSize: 13,color: Colors.blueGrey[100]
                              ),),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),]
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: Colors.grey[850],
        body: ListView(
          children: <Widget>[
            CustomCard("Java",images[0],text[0]),
            CustomCard("Python",images[1],text[1]),
            CustomCard("C++",images[2],text[2]),
            CustomCard("Javascript",images[3],text[3]),
          ],
        ),

      ),
    );
  }
}
