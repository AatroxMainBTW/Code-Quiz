import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/screens/home.dart';

Widget _returntext(int numb){
  if(numb == 5){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text("You are average you should learn more",
      style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "SpaceMono"
      ),),
        SizedBox(width: 15,),
        CircleAvatar(
          backgroundColor: Colors.orangeAccent,
        )
      ],
    );
  } else if(numb > 5 && numb < 10){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Text("You are above the \n average level try harder",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "SpaceMono"
          ),),
        SizedBox(width: 15,),
        CircleAvatar(
          backgroundColor: Colors.lightBlue,
        )
      ],
    );
  }else if(numb == 10){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text("You are really good",
      style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "SpaceMono"
      ),),
        SizedBox(width: 15,),
        CircleAvatar(
          backgroundColor: Colors.green,
        )
      ],
    );
  }else if (numb == 0){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("AHHHHH trash but you \n can still learn",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "SpaceMono"
          ),),
        SizedBox(width: 15,),
        CircleAvatar(
          backgroundColor: Colors.red,
        )
      ],
    );
  } else if(numb > 0 && numb < 5){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("U are not even trying man !",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "SpaceMono"
          ),),
        SizedBox(width: 15,),
        CircleAvatar(
          backgroundColor: Colors.redAccent,
        )
      ],
    );
  }
}

class Result extends StatelessWidget {
  Map data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[850],
          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

                  _returntext(data['points']),
              SizedBox(height: 30,),
              Text("Result: "+data['points'].toString()+"/10",style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "SpaceMono"
              ),),
              SizedBox(height: 30,),
              Text("Click The Button below to \n return to the  main screen",style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "SpaceMono"
              ),),

              ],
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Home()),
    );
    },
      // splashColor: Colors.pink[400],
      backgroundColor: Colors.blue[900],
      child: Icon(Icons.navigate_next, color: Colors.white),
    ),
      ),
    );
  }
}
