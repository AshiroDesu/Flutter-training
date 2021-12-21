import 'package:cookbook_flutter_form/training_mock/bloc_provider.dart';
import 'package:cookbook_flutter_form/training_mock/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_flutter_form/training_mock/person_bloc.dart';
import 'package:cookbook_flutter_form/training_mock/person_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: PersonBloc(PersonRepository(Client())),
        child: HomePage(),
      ),
    );
  }
}
