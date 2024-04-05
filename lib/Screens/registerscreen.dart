import 'package:flutter/material.dart';
import 'package:quizzapp/db/fuctions.dart';
import 'package:quizzapp/db/model.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/utilities/routes.dart';
import 'package:quizzapp/widgets/textbox.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double height = 1;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController nicknamecontroller = TextEditingController();
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
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Center(
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
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
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
                            text: "name",
                            iconName: Icons.people,
                            tcontroller: usernamecontroller,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter some text';
                              }
                              return null;
                            },
                            hideText: false,
                          ),
                          TextBoxWidget(
                            text: 'phone number',
                            iconName: Icons.phone,
                            tcontroller: phonecontroller,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter some text';
                              } else if (value.length < 10 ||
                                  value.length > 10) {
                                return 'enter valid phone number';
                              }
                              return null;
                            },
                            hideText: false,
                          ),
                          TextBoxWidget(
                            text: 'nickname',
                            iconName: Icons.emoji_emotions,
                            tcontroller: nicknamecontroller,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter some text';
                              }

                              return null;
                            },
                            hideText: false,
                          ),
                          TextBoxWidget(
                            text: 'password',
                            iconName: Icons.lock,
                            hideText: true,
                            tcontroller: passwordController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter some text';
                              } else if (value.length < 8) {
                                return 'password must have atleast 8 charecters';
                              }
                              return null;
                            },
                          ),
                          MaterialButton(
                            onPressed: ()  {
                              String email = emailController.text.trim();
                              String name = usernamecontroller.text.trim();
                              String phone = phonecontroller.text.trim();
                              String nickname = nicknamecontroller.text.trim();
                              String password = passwordController.text.trim();
                              if (formkey.currentState!.validate()) {
                              DetialsModel user=DetialsModel(email: email, password: password, name: name, nickname: nickname, phone: phone);
                                   addDetails(user);
                                     Navigator.pushNamed(
                                    context, Routes.loginScreen);
                                    
                              }
                              return;
                            },
                            color: Colors.red,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
