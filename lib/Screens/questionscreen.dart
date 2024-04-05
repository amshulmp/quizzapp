import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzapp/db/questiondb.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/utilities/routes.dart';
import 'package:quizzapp/widgets/addedquestions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _UserHomeState();
}

class _UserHomeState extends State<QuestionScreen> {
  final mybox = Hive.box('mybox');
  QuestionDatabase db = QuestionDatabase();
  int count = 0;
  Color color1 = Colors.yellow;
  Color color2 = Colors.yellow;
  Color color3 = Colors.yellow;
  Color color4 = Colors.yellow;
  Color color5 = Colors.yellow;
  bool click=true;
  List score = [];
  List randomquestions = [];
  String question = "";
  String option1 = "";
  String option2 = "";
  String option3 = "";
  String option4 = "";
  String option5 = "";
  String answer = "";
  String text = "next";

  @override
  void initState() {
     if(mybox.get("QUESTIONLIST")==null){
     db.createInitialData(); 
    }
    else{
      db.getData();
    }
    super.initState();
    random();
    var data = randomquestions[count];
    // for (var data in randomquestions) {
    setState(() {
      question = data[0];
      option1 = data[1];
      option2 = data[2];
      option3 = data[3];
      option4 = data[4];
      option5 = data[5];
      answer = data[6];
    });
    //}
    super.initState();
  }

  void random() {
    while (randomquestions.length < 15 && db.questionList.isNotEmpty) {
      List random = db.questionList[Random().nextInt(db.questionList.length)];
      if (!randomquestions.contains(random)) {
        setState(() {
          randomquestions.add(random);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                Assets.background,
              ),
              fit: BoxFit.fitWidth,
            )),
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.height * 1,
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Center(
                          child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              Assets.logo,
                            ),
                            fit: BoxFit.scaleDown,
                          )),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromARGB(6, 255, 255, 255),
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Display(displaytext: "${count + 1} .$question"),
                          Options(
                            option: "A. $option1",
                            color: color1,
                            onclick:click ? () {
                              setState(() {
                                if (answer == "a") {
                                  click=false;
                                  color1 = Colors.green;
                                  score.add(1);
                                } else {
                                  color1 = Colors.red;
                                  click=false;
                                }
                              });
                            }:null,
                    
                          ),
                          Options(
                            option: "B. $option2",
                            color: color2,
                            onclick: click ? () {
                              setState(() {
                                click=false;
                                if (answer == "b") {
                                  color2 = Colors.green;
                                  score.add(1);
                                } else {
                                  color2 = Colors.red;
                                  click=false;
                                }
                              });
                            }:null,
                    
                          ),
                          Options(
                            option: "C. $option3",
                            color: color3,
                            onclick: click ?() {
                              setState(() {
                                click=false;
                                if (answer == "c") {
                                  color3 = Colors.green;
                                  score.add(1);
                                } else {
                                  color3 = Colors.red;
                                  click=false;
                                }
                              });
                            }:null,
                    
                          ),
                          Options(
                            option: "D. $option4",
                            color: color4,
                            onclick:click? () {
                              setState(() {
                                click=false;
                                if (answer == "d") {
                                  color4 = Colors.green;
                                  score.add(1);
                                } else {
                                  color4 = Colors.red;
                                  click=false;
                                }
                              });
                            }:null,
                    
                          ),
                          Options(
                            option: "E. $option5",
                            color: color5,
                            onclick: click ? () {
                              setState(() {
                                click=false;
                                if (answer == "e") {
                                  color5 = Colors.green;
                                  score.add(1);
                                } else {
                                  color5 = Colors.red;
                                  click=false;
                                }
                              });
                            }:null,
                            
                          ),
                          Center(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  if (count < randomquestions.length - 1) {
                                    count++;
                                    var data = randomquestions[count];
                                    question = data[0];
                                    option1 = data[1];
                                    option2 = data[2];
                                    option3 = data[3];
                                    option4 = data[4];
                                    option5 = data[5];
                                    answer = data[6];
                                    color1 = Colors.yellow;
                                    color2 = Colors.yellow;
                                    color3 = Colors.yellow;
                                    color4 = Colors.yellow;
                                    color5 = Colors.yellow;
                                    click=true;
                                  } else {
                                    text = "finish";
                                   
                                    Navigator.pushNamed(context, Routes.result,
                                        arguments: score.length);
                                  }
                                  print(score.length);
                                });
                              },
                              color: Colors.red,
                              child: Text(
                                text,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            )));
  }
}

class Options extends StatelessWidget {
  final String option;
  final Color color;
  final dynamic onclick;
 
  const Options(
      {super.key,
      required this.option,
      required this.color,
      required this.onclick,
     });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
     
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 7,
        child: Center(
            child: Text(
          option,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        )),
      ),
    );
  }
}
