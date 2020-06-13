import 'package:floorsqltesting/person.dart';
import 'package:floorsqltesting/person_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ShowPerson.dart';

class HomePage extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController fath = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  String data = "";
  final PersonDao dao;

  HomePage({
    Key key,
    @required this.dao,
  })  : name = TextEditingController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                controller: name,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.yellow)),
                    labelText: 'Name',
                    hintText: 'Name'),
                onSubmitted: (_) async {
                  await _persistMessage();
                },
              ),
              TextField(
                controller: fath,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red)),
                    labelText: 'Father Name',
                    hintText: 'Father Name'),
                onSubmitted: (_) async {
                  await _persistMessage();
                },
              ),
              TextField(
                controller: address,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide:
                            new BorderSide(width: 10, color: Colors.green)),
                    labelText: 'Address',
                    hintText: 'Addrees'),
                onSubmitted: (_) async {
                  await _persistMessage();
                },
              ),
              TextField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.blue)),
                    labelText: 'Phone Number',
                    hintText: 'Phone Number'),
                onSubmitted: (_) async {
                  await _persistMessage();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text('submit'),
                    onPressed: () {
                      _persistMessage();
                    },
                  ),
                  RaisedButton(
                    child: Text('show'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PeraonListView(
                                    dao: dao,
                                  )));
                    },
                  )
                ],
              )
            ]),
      ),
    );
  }

  Future<void> _persistMessage() async {
    final message = name.text + fath.text + address.text + phone.text;
    print('message: $message');
    if (message.trim().isEmpty) {
      name.clear();
      fath.clear();
      address.clear();
      phone.clear();
    } else {
      final person = Person(
        null,
        name.text,
        fath.text,
        address.text,
        int.parse(phone.text),
      );
      await dao.insertPerson(person);
      name.clear();
      fath.clear();
      address.clear();
      phone.clear();
    }
  }
}
