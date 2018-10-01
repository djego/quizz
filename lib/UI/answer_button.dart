import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final bool _answer;

  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context){
    return new Expanded(  // True button
      child: new Material(
        color: _answer == true ? Colors.green[400] : Colors.red[400],
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              
              padding: new EdgeInsets.all(20.0),
              child: new Text(_answer == true ? "Verdadero" : "Falso", 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 40.0, 
                  fontWeight: FontWeight.bold, 
                  fontStyle: FontStyle.italic
                )
              ),
            )
          )
        )
      )
    );
            
  }
}


