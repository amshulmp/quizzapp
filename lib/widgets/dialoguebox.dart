import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogeBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final questioncontroller;
  final formkey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  final optiotion1controller;
  // ignore: prefer_typing_uninitialized_variables
  final optiotion2controller;
  // ignore: prefer_typing_uninitialized_variables
  final optiotion3controller;
  // ignore: prefer_typing_uninitialized_variables
  final optiotion4controller;
  // ignore: prefer_typing_uninitialized_variables
  final optiotion5controller;
  // ignore: prefer_typing_uninitialized_variables
  final answercontroller;
   VoidCallback onsave;
   DialogeBox(
      {super.key,
      required this.questioncontroller,
      required this.optiotion1controller,
      required this.optiotion2controller,
      required this.optiotion3controller,
      required this.optiotion4controller,
      required this.optiotion5controller,
      required this.answercontroller,
      required this.onsave});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          AlertDialog(
            backgroundColor: Colors.black,
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                      controller: questioncontroller,
                      decoration: const InputDecoration(
                        hintText: "question",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),
                  TextFormField(
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                      controller: optiotion1controller,
                      decoration: const InputDecoration(
                        hintText: "option1",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),
                  TextFormField(
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                      controller: optiotion2controller,
                      decoration: const InputDecoration(
                        hintText: "option2",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),
                  TextFormField(
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                      controller: optiotion3controller,
                      decoration: const InputDecoration(
                        hintText: "option3",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),
                  TextFormField(
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                      controller: optiotion4controller,
                      decoration: const InputDecoration(
                        hintText: "option4",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),
                  TextFormField(
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                      controller: optiotion5controller,
                      decoration: const InputDecoration(
                        hintText: "option5",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),
                  TextFormField(
                      validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                      controller: answercontroller,
                      decoration: const InputDecoration(
                        hintText: "answer",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      )),
                        Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: onsave,
                        color: Colors.red,
                        child: const Text(
                          "add",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.red,
                        child: const Text(
                          "cancel",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
