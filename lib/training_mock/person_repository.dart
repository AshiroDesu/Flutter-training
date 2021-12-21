import 'dart:convert';

import 'package:http/http.dart';

import 'person.dart';

class PersonRepository {
  final Client client;

  PersonRepository(this.client);

  Future<List<Person>> getPerson() async {
    final response = await client.get(
        Uri.parse('https://61bfdd7db25c3a00173f4f07.mockapi.io/api/v1/users'));
    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((e) => Person.fromMap(e)).toList();
    } else {
      throw Exception("Error na internet");
    }
  }
}
