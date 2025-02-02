import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain qb =QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  List<Icon> scorekepper = [];
int quest=0;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
               qb.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if(quest == 13) {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "End of Questions",
                  ).show();
                }
                if(quest<12) {
                  bool correctanswer = qb.getAnswer();
                  if (correctanswer == true) {
                    scorekepper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                    );
                  }
                  else {
                    scorekepper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                    );
                  }
                }
                setState(() {
                  if(quest<=12) {
                    quest++;
                  }
                qb.nextQues();
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if(quest == 13) {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "End of Questions",
                  ).show();
                }
                if(quest<12) {
                  bool correctanswer = qb.getAnswer();
                  if (correctanswer == false) {
                    scorekepper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                    );
                  }
                  else {
                    scorekepper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                    );
                  }
                }
                setState(() {
                  quest++;
               qb.nextQues();
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(children: scorekepper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
