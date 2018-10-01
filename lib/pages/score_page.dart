import 'package:flutter/material.dart';

import './landing_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestion;
  final String message;

  ScorePage(this.score, this.totalQuestion, this.message);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue[400],
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          new Text("Tu puntaje: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),),
          new Text(score.toString()+ "/"+ totalQuestion.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),),
          new IconButton(
            icon: new Icon(Icons.replay),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null)
          ),
          new Padding(
              padding: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: new Text('"'+message+'"', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45.0),),
            ),


        ],
      )
    );
  }

}