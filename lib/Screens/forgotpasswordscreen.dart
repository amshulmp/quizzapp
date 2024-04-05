import 'package:flutter/material.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/utilities/routes.dart';
import 'package:quizzapp/widgets/textbox.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
      TextEditingController nicknamecontroller = TextEditingController();
      TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    final formkey = GlobalKey<FormState>();
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
                    height: MediaQuery.of(context).size.height * 0.4,
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
                              
                              if (formkey.currentState!.validate()) {
                             
                                     Navigator.pushNamed(
                                    context, Routes.loginScreen);
                                    
                              }
                              return;
                            },
                            color: Colors.red,
                            child: const Text(
                              "Change pasword",
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
            ),
    ),
    );
  }
}