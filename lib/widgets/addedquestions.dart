import 'package:flutter/material.dart';

class AddeedQuestions extends StatelessWidget {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String option5;
  final String answer;
  final int id;
  final dynamic deleteQuestion;
  const AddeedQuestions(
      {super.key,
      required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      required this.option5,
      required this.answer, 
      required this.id, 
      required this.deleteQuestion,
       });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Display(displaytext: "${id+1}. $question"),
                Display(displaytext: "A. $option1"),
                Display(displaytext: "B. $option2"),
                Display(displaytext: "C. $option3"),
                Display(displaytext: "D. $option4"),
                Display(displaytext: "E. $option5"),
                Display(displaytext: "Answer = $answer"),
                MaterialButton(onPressed:deleteQuestion,
                color: Colors.red,
                child: const Text("Delete",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                )
              ],
            ),
          )
          ),
    );
  }
}

class Display extends StatelessWidget {
  final String displaytext;
  const Display({super.key, required this.displaytext});

  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.centerLeft,
      child: Text(displaytext,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
       
          )),
    );
  }
}