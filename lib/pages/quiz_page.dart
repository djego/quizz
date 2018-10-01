import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override 
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("¿Fuku es un alguien de la Cafeta?", true),
    new Question("¿UGO es un app?", true),
    new Question("¿PEPE es un app?", false),
    new Question("¿Somos un equipo auto gestionado?", true),
    new Question("¿Somos más de 20?", true),
    new Question("¿Amamos los Tunking?", true),
    new Question("¿El team amaretto ve proyectos de UTP?", false),
    new Question("¿La Cafeta Lab se creo en el 2014?", false),


  ]);

  String questionText;
  String messageResult;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;

  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( 
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if (quiz.length == questionNumber){
              if(quiz.score == quiz.length){
                messageResult = "Tu si sabes :D";
              }else if(quiz.score > 0){
                messageResult = "Bien! algo se te quedo :)";
              }else{
                messageResult = "No puede ser no te explicamos bien nada :(";
              }
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length, messageResult)), (Route route) => route == null);
              return;
            } 
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }

}