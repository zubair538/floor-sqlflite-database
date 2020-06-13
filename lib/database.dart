// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:floorsqltesting/person.dart';
import 'package:floorsqltesting/person_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part "database.g.dart"; // the generated code will be there

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}
