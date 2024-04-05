import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzapp/db/fuctions.dart';
import 'package:quizzapp/root.dart';

Future<void> main(List<String> args) async{
   await Hive.initFlutter();
   var box1 = await Hive.openBox('mybox');
    WidgetsFlutterBinding.ensureInitialized();
 await initializeDataBase();
  runApp(const Root());
}