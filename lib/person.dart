import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final int id;
  final String name;
  int phonenumber;
  String fathername, address;
  Person(this.id, this.name, this.fathername, this.address, this.phonenumber);
}
