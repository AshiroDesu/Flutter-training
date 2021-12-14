import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_flutter_form/evento_model.dart';

class Item extends StatefulWidget {
  const Item({Key? key, required this.evento}) : super(key: key);

  final Evento evento;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  removeEvent(String id) async {
    var response =
        await Dio().delete('https://webapi-event.herokuapp.com/v1/event/$id');
    debugPrint(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (events) {
        removeEvent(widget.evento.id);
      },
      child: ListTile(
        title: Text(
          widget.evento.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('id: ${widget.evento.id}'),
        trailing: Text(widget.evento.amount.toString()),
      ),
      background: Container(color: Colors.red),
    );
  }
}
