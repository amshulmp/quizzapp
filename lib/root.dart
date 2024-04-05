import 'package:flutter/material.dart';
import 'package:quizzapp/Screens/Splashscreen.dart';
import 'package:quizzapp/Screens/adminscreen.dart';
import 'package:quizzapp/Screens/forgotpasswordscreen.dart';
import 'package:quizzapp/Screens/loginscreen.dart';
import 'package:quizzapp/Screens/questionscreen.dart';
import 'package:quizzapp/Screens/registerscreen.dart';
import 'package:quizzapp/Screens/resultscreen.dart';
import 'package:quizzapp/Screens/userscreen.dart';
import 'package:quizzapp/utilities/routes.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashscreen,
     routes: {
   Routes.loginScreen:(context) => const LoginScreen(),
      Routes.registerscreen:(context) => const RegisterScreen(),
      Routes.adminhomescreen:(context) =>const  AdminHomeScreen(),
      Routes.splashscreen:(context)=> const SplashScreen(),
       Routes.userhomeScreen:(context)=> const UserHome(),  
       Routes.question:(context)=> const QuestionScreen(),
        Routes.result:(context)=> const ResultScreen(),
         Routes.password:(context)=> const PasswordScreen(),
        },
    );
  }
}