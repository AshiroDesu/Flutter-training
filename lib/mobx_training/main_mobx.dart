import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'controller.dart';

class MboxScreen extends StatelessWidget {
  final controller = ControllerMobx();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "nome"),
                onChanged: controller.changeName,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: "sobrenome"),
                onChanged: controller.changeSurname,
              ),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return Text('${controller.fullName}');
              })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
