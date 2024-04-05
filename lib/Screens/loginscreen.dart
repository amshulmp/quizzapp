// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzapp/db/fuctions.dart';
import 'package:quizzapp/db/questiondb.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/utilities/routes.dart';
import 'package:quizzapp/widgets/textbox.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final mybox = Hive.box('mybox');
  QuestionDatabase db = QuestionDatabase();
  double height = 1;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
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
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBoxWidget(
                            text: 'email',
                            iconName: Icons.email,
                            tcontroller: emailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter some text';
                              } else if (!RegExp(r'\S+@\S+\.\S+')
                                  .hasMatch(value)) {
                                return 'Not a valid email';
                              }
                              return null;
                            },
                            hideText: false,
                          ),
                          TextBoxWidget(
                            text: 'password',
                            iconName: Icons.lock,
                            tcontroller: passwordController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter some text';
                              } else if (value.length < 8) {
                                return 'password must have atleast 8 charecters';
                              }
                              return null;
                            },
                            hideText: true,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, Routes.password);
                                  },
                                  child: const Text(
                                    "forgot password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))),
                          MaterialButton(
                            onPressed: () async {
                              final dynamic data = await getAllDetails();
                            final String  email=emailController.text.trim();
                            final String  password=passwordController.text.trim();
                              if (formkey.currentState!.validate()) {
                                if(email=="admin.gmail.com"|| password=="admin123"){
                                    Navigator.pushNamed(context, Routes.adminhomescreen);
                                    return;
                                }
                               else{
                               for(var data in data)
                            {
                              if(
                                data['email']==email && data['password']==password)
                              {
                              
                                   Navigator.pushNamed(context, Routes.userhomeScreen,arguments: data['name']);
                                   print(data['name']);
                              }}
                               }
                              }
                              return;
                            },
                            color: Colors.red,
                            child: const Text(
                              "login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "dont have an account ? ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.registerscreen);
                                  },
                                  child: const Text(
                                    "register",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
