import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:cookbook_flutter_form/mobx_training/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final VoidCallback removeClicked;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.removeClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(item.title),
          trailing: IconButton(
            color: Colors.red,
            icon: Icon(Icons.remove_circle),
            onPressed: removeClicked,
          ),
        );
      },
    );
  }
}
