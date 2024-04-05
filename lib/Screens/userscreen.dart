import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzapp/db/questiondb.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/utilities/routes.dart';



class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
   final mybox = Hive.box('mybox');
  QuestionDatabase db = QuestionDatabase();
  @override
  Widget build(BuildContext context) {
    final name =
        ModalRoute.of(context)?.settings.arguments as String;
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
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Center(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        Assets.logo,
                      ),
                      fit: BoxFit.scaleDown,
                    )),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Text(
                          "Welcome $name",
                          style: const TextStyle(
                            fontSize: 30,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        
                       MaterialButton(
                           onPressed: () {
                            Navigator.pushNamed(context, Routes.question) ;
                           },
                           color: Colors.red,
                           child: const Text(
                             "Start Quiz",
                             style: TextStyle(
                                 color: Colors.white, fontWeight: FontWeight.bold),
                           ),
                         ),
                     ],
                   ),
                  ),
                ),
              ],
            )));
  }
}
