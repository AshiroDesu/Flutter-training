import 'dart:math';
import 'package:flutter/material.dart';
import 'evento_model.dart';
import 'components/item.dart';
import 'surd_controller.dart';

class SurdoDIO extends StatefulWidget {
  const SurdoDIO({Key? key}) : super(key: key);

  @override
  State<SurdoDIO> createState() => _SurdoDIOState();
}

class _SurdoDIOState extends State<SurdoDIO> {
  late FocusNode myFocusNode;
  late SurdController surdCont;

  late Future<List<Evento>> events;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    events = Future.sync(() => surdCont.find());
    surdCont = SurdController(Evento(id: '', name: '', amount: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: surdCont.keyForm,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: max(500, 80),
                      child: TextFormField(
                        controller: surdCont.controller,
                        focusNode: myFocusNode,
                        autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor, insira um texto não nulo";
                          }
                          return null;
                        },
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Insira seu texto aqui"),
                      ),
                    ),
                    SizedBox(
                      width: min(80, 80),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<CircleBorder>(
                                  const CircleBorder(
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () async {
                            if (surdCont.keyForm.currentState!.validate()) {
                              var response = await surdCont
                                  .createPost(surdCont.controller.text);

                              if (response.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('O item já foi cadastrado.')));
                              }

                              var result = Future.sync(() => surdCont.find());
                              setState(() {
                                events = result;
                              });
                            } else {
                              myFocusNode.requestFocus();
                            }
                          },
                          child: const Icon(Icons.add)),
                    ),
                  ],
                ),
                FutureBuilder<List<Evento>>(
                  future: events,
                  builder: (context, snap) {
                    List<Widget> children = [];
                    if (snap.hasData) {
                      for (var item in snap.data as List<Evento>) {
                        children.add(Item(evento: item));
                      }
                      return Center(
                        child: SizedBox(
                          child: ListView(children: children),
                          height: 500,
                          width: double.maxFinite,
                        ),
                      );
                    } else if (snap.hasError) {
                      return const Center(
                        child: Text('Nenhum dado encontrado'),
                      );
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          child: CircularProgressIndicator(),
                          width: 80,
                          height: 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text('Awaiting result...'),
                        ),
                      ];
                      return SizedBox(
                        child: ListView(
                          children: children,
                        ),
                        width: double.maxFinite,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
