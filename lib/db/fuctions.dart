// ignore_for_file: avoid_print

import 'package:quizzapp/db/model.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;

Future<void> initializeDataBase() async {
  _db = await openDatabase(
    'userdetails.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE userdetails(id INTEGER PRIMARY KEY, email TEXT, password TEXT,nickname TEXT,phone TEXT,name TEXT)');
    },
  );
}

Future<dynamic> getAllDetails() async {
  final List<Map<String, dynamic>> _values = await _db.rawQuery('SELECT * FROM userdetails');
  print(_values);
  return _values;
 
}

Future<void> addDetails(DetialsModel value) async {
  int id=await _db.insert('useretails', value.toMap());
  print(id);
    final List<Map<String, dynamic>> _values = await _db.rawQuery('SELECT * FROM userdetails');
   print(_values);
}
