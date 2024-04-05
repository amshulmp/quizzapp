import 'package:flutter/material.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/utilities/routes.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
   final score = ModalRoute.of(context)!.settings.arguments as int;
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
                  child: Center(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
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
                  padding:  const EdgeInsets.all(15.0),
                  child: Center(
                    child: SizedBox(
                     
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.27,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "your score",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black),
                          ),
                           Text(
                            "$score",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                                color: Colors.black),
                          ),
                          MaterialButton(onPressed: (){
                          Navigator.pushNamed(context, Routes.question);
                          },
                          color: Colors.red,
                              child: const Text(
                                "retry",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
