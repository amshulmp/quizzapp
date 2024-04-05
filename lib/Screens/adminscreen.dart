import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzapp/db/questiondb.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/widgets/addedquestions.dart';
import 'package:quizzapp/widgets/dialoguebox.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final mybox = Hive.box('mybox');
  QuestionDatabase db = QuestionDatabase();
  @override
  void initState() {
       if(mybox.get("QUESTIONLIST")==null){
     db.createInitialData(); 
    }
    else{
      db.getData();
    }
    super.initState();;
  }
  TextEditingController questioncomtroller = TextEditingController();
  TextEditingController option1comtroller = TextEditingController();
  TextEditingController option2comtroller = TextEditingController();
  TextEditingController option3controller = TextEditingController();
  TextEditingController option4comtroller = TextEditingController();
  TextEditingController option5comtroller = TextEditingController();
  TextEditingController answercomtroller = TextEditingController();
  void deleteQuestion(int index) {
    setState(() {
      db.questionList.removeAt(index);
    });
    db.updateDatabase();
  }
  // ignore: non_constant_identifier_names
  void AddNewQuestion() {
    setState(() {
       final String question = questioncomtroller.text.trim() ;
      final String option1 = option1comtroller.text.trim()  ;
      final String option2 = option2comtroller.text.trim() ;
      final String option3 = option3controller.text.trim() ;
      final String option4 = option4comtroller.text.trim() ;
      final String option5 = option5comtroller.text.trim() ;
      final String answer = answercomtroller.text.trim() ;
      db.questionList
          .add([question, option1, option2, option3, option4, option5, answer]);
      questioncomtroller.clear();
      option1comtroller.clear();
      option2comtroller.clear();
      option3controller.clear();
      option4comtroller.clear();
      option5comtroller.clear();
      answercomtroller.clear();
    });
    Navigator.of(context).pop();
     db.updateDatabase();
  }

  void createQuestion(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogeBox(
            questioncontroller: questioncomtroller,
            optiotion1controller: option1comtroller,
            optiotion2controller: option2comtroller,
            optiotion3controller: option3controller,
            optiotion4controller: option4comtroller,
            optiotion5controller: option5comtroller,
            answercontroller: answercomtroller, onsave:AddNewQuestion,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          createQuestion(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            Assets.background,
          ),
          fit: BoxFit.fitWidth,
        )),
        child: ListView.builder(
  itemCount: db.questionList.length,
  itemBuilder: (context, index) {
    return AddeedQuestions(
      question: db.questionList[index][0],
      option1: db.questionList[index][1],
      option2: db.questionList[index][2],
      option3: db.questionList[index][3],
      option4: db.questionList[index][4],
      option5: db.questionList[index][5],
      answer: db.questionList[index][6],
      id: index,
      deleteQuestion: () => deleteQuestion(index),
    );
  },
),

      ),
    );
  }
}
