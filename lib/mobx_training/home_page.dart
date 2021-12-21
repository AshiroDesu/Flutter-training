import 'package:cookbook_flutter_form/mobx_training/home_controller.dart';
import 'package:cookbook_flutter_form/mobx_training/item_model.dart';
import 'package:cookbook_flutter_form/mobx_training/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  _dialog() {
    var model = ItemModel("");

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("novo item"),
            content: TextField(
              onChanged: model.setTitle,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "novo item",
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    controller.addItem(model);
                    Navigator.pop(context);
                  },
                  child: Text('Salvar')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancelar')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mbox List"),
        actions: <Widget>[
          IconButton(
            icon: Observer(
              builder: (_) {
                return Text('${controller.totalItems}');
              },
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: controller.listItems.length,
            itemBuilder: (_, index) {
              var item = controller.listItems[index];
              return ItemWidget(
                item: item,
                removeClicked: () {
                  controller.removeItem(item);
                },
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _dialog();
          }),
    );
  }
}
