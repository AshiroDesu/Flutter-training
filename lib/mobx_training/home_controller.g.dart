// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  Computed<int>? _$totalItemsComputed;

  @override
  int get totalItems =>
      (_$totalItemsComputed ??= Computed<int>(() => super.totalItems,
              name: 'HomeControllerBase.totalItems'))
          .value;

  final _$listItemsAtom = Atom(name: 'HomeControllerBase.listItems');

  @override
  ObservableList<ItemModel> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<ItemModel> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  dynamic addItem(ItemModel model) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.addItem');
    try {
      return super.addItem(model);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(ItemModel model) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.removeItem');
    try {
      return super.removeItem(model);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItems: ${listItems},
totalItems: ${totalItems}
    ''';
  }
}
