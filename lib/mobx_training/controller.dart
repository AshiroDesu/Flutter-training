import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class ControllerMobx = ControllerBase with _$ControllerMobx;

abstract class ControllerBase with Store {
  @observable
  String nome = '';

  @observable
  String sobrenome = '';

  @computed
  String get fullName => "$nome $sobrenome";

  @action
  changeName(String newName) {
    nome = newName;
  }

  @action
  changeSurname(String newSurname) {
    sobrenome = newSurname;
  }
}
