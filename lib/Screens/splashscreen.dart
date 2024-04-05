import 'package:flutter/material.dart';
import 'package:quizzapp/utilities/assets.dart';
import 'package:quizzapp/utilities/routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
    (){
      Navigator.pushNamed(context, Routes.loginScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                   height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*0.6,
            child: Center(
              child: Image.asset(Assets.logo,fit: BoxFit.scaleDown,)
            ),
                ),
                SizedBox(
                   height: MediaQuery.of(context).size.height*0.2,
                ),
                const CircularProgressIndicator(
                  color: Colors.black,
                )
              ],
            ),
          ),
      )
    );
  }
}