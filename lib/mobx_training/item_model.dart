import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase(this.title);

  @observable
  String title;

  @action
  setTitle(String value) => title = value;
}
