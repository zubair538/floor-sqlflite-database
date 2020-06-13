import 'package:floorsqltesting/person.dart';
import 'package:floorsqltesting/person_dao.dart';
import 'package:flutter/material.dart';

class PeraonListView extends StatelessWidget {
  ///show data b
  final PersonDao dao;

  const PeraonListView({
    Key key,
    @required this.dao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<List<Person>>(
          stream: dao.findAllPersonAsStream(),
          //stream: dao.findAllTasksAsStream(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) return Container();
            final persons = snapshot.data;
            return ListView.builder(
              itemCount: persons.length,
              itemBuilder: (_, index) {
                return PersonItem(
                  person: persons[index],
                  dao: dao,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class PersonItem extends StatelessWidget {
  ///show data
  final Person person;
  final PersonDao dao;

  const PersonItem({
    Key key,
    @required this.person,
    @required this.dao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${person.hashCode}'),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(person.name),
                  Text(person.fathername),
                  Text(person.address),
                  Text(person.phonenumber.toString()),
                ],
              )
            ],
          )),
      onDismissed: (_) async {
        await dao.deletePerson(person);

        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(
          const SnackBar(content: Text('Removed person')),
        );
      },
    );
  }
}
