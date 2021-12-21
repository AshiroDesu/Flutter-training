import 'package:bloc/bloc.dart';
import 'package:cookbook_flutter_form/training_mock/person_repository.dart';
import 'package:cookbook_flutter_form/training_mock/person_state.dart';

enum PersonEvent { clear, fetch }

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;
  PersonBloc(this.repository) : super(PersonListState([]));

  @override
  Stream<PersonState> mapEventToState(PersonEvent, event) async* {
    if (event == PersonEvent.clear) {
      yield PersonListState([]);
    } else if (event == PersonEvent.fetch) {
      yield PersonLoadingState();
      try {
        final list = await repository.getPerson();
        yield PersonListState(list);
      } on Exception catch (e) {
        yield PersonErrorState(e);
      }
    }
  }
}
