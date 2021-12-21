import 'package:cookbook_flutter_form/training_mock/person_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  final client = ClientMock();
  final repository = PersonRepository(client);
  test('Deve pergar uma lista de Person', () async {
    when(() => client.get(Uri.parse(
            "https://61bfdd7db25c3a00173f4f07.mockapi.io/api/v1/users")))
        .thenAnswer((_) async => http.Response(jsonReturn, 200));
    final list = await repository.getPerson();

    expect(list.isNotEmpty, equals(true));
    expect(list.first.name, equals('name 1'));
  });

  test('Deve retornar um erro', () async {
    when(() => client.get(Uri.parse(
            "https://61bfdd7db25c3a00173f4f07.mockapi.io/api/v1/users")))
        .thenAnswer((_) async => http.Response(jsonReturn, 404));

    expect(() async => await repository.getPerson(), throwsException);
  });
}

const jsonReturn =
    '[{"name":"name 1","age":26,"height":65,"weight":79,"id":"1"},{"name":"name 2","age":27,"height":8,"weight":96,"id":"2"},{"name":"name 3","age":20,"height":50,"weight":20,"id":"3"},{"name":"name 4","age":59,"height":86,"weight":68,"id":"4"},{"name":"name 5","age":53,"height":56,"weight":39,"id":"5"},{"name":"name 6","age":10,"height":19,"weight":55,"id":"6"},{"name":"name 7","age":64,"height":91,"weight":78,"id":"7"},{"name":"name 8","age":97,"height":12,"weight":25,"id":"8"},{"name":"name 9","age":48,"height":57,"weight":22,"id":"9"},{"name":"name 10","age":64,"height":10,"weight":61,"id":"10"},{"name":"name 11","age":43,"height":83,"weight":36,"id":"11"},{"name":"name 12","age":84,"height":52,"weight":58,"id":"12"},{"name":"name 13","age":89,"height":30,"weight":90,"id":"13"},{"name":"name 14","age":46,"height":62,"weight":29,"id":"14"},{"name":"name 15","age":85,"height":19,"weight":35,"id":"15"},{"name":"name 16","age":94,"height":10,"weight":58,"id":"16"}]';
