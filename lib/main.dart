import 'package:floorsqltesting/home_Page.dart';
import 'package:floorsqltesting/person_dao.dart';
import 'package:flutter/material.dart';
import 'database.dart';
//import 'database.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('Darzi_database.db').build();
  final dao = database.personDao;
  runApp(MyApp(dao));
}

class MyApp extends StatelessWidget {
  final PersonDao dao;
  const MyApp(this.dao);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        dao: dao,
      ),
    );
  }
}
