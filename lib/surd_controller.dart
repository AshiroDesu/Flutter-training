import 'package:cookbook_flutter_form/surd_create_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'evento_model.dart';

class Controller extends ChangeNotifier {
  final SurdRepository repository;
  Controller(this.repository);
  late String name;
  late int amount;

  void getName(int id) {
    name = repository.getName(id);
    notifyListeners();
  }

  void getAmount() async {
    amount = repository.getAmount();
    notifyListeners();
  }
}

class SurdController {
  final Evento evento;

  SurdController(this.evento);
  TextEditingController controller = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  Future<List<Evento>> createPost(String name) async {
    try {
      var response = await Dio().post(
          'https://webapi-event.herokuapp.com/v1/event',
          data: {'name': name});

      return response.data;
    } on DioError catch (e) {
      debugPrint(e.response?.data['message']);
      return [];
    }
  }

  Future<List<Evento>> find() async {
    try {
      var response =
          await Dio().get('https://webapi-event.herokuapp.com/v1/event');

      var elements = response.data['data'];

      List<Evento> eventos = [];

      for (var item in elements) {
        Evento evento = Evento.fromMap(item);

        eventos.add(evento);

        debugPrint(evento.name);
      }

      return eventos;
    } on DioError {
      return [];
    }
  }
}
