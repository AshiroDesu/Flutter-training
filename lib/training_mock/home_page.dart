import 'package:cookbook_flutter_form/training_mock/bloc_provider.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc =
        BlocProvider.get(context);
    return Container();
  }
}

class _ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc =
        context.dependOnInheritedWidgetOfExactType<BlocProvider>()!.bloc;

    return Container();
  }
}

class _ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc =
        context.dependOnInheritedWidgetOfExactType<BlocProvider>()!.bloc;

    return Container();
  }
}
