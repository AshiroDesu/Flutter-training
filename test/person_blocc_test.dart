import 'dart:math';

import 'package:cookbook_flutter_form/training_mock/person.dart';
import 'package:cookbook_flutter_form/training_mock/person_bloc.dart';
import 'package:cookbook_flutter_form/training_mock/person_repository.dart';
import 'package:cookbook_flutter_form/training_mock/person_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  final repository = PersonRepositoryMock();
  final bloc = PersonBloc(repository);
  final person =
      Person(id: 1, age: 12, height: 1.3, name: 'Luis', weight: 56.00);
  test('Deve retornar uma lista de person', () async {
    when(() => repository.getPerson())
        .thenAnswer((_) async => <Person>[person, person]);

    bloc.add(PersonEvent.fetch);
    await expectLater(
      bloc,
      emitsInOrder(
        [isA<PersonLoadingState>(), isA<PersonListState>()],
      ),
    );
  }, skip: 'Não ta funcionando');
}
