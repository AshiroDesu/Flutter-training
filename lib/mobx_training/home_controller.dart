import 'package:cookbook_flutter_form/mobx_training/item_model.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel('title1'),
    ItemModel('title2'),
    ItemModel('title3'),
  ].asObservable();

  @computed
  int get totalItems => listItems.length;

  @action
  addItem(ItemModel model) {
    listItems.add(model);
  }

  @action
  removeItem(ItemModel model) {
    listItems.removeWhere((item) => item.title == model.title);
  }
}
