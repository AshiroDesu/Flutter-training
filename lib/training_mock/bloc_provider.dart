import 'dart:js';

import 'package:cookbook_flutter_form/training_mock/person_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  final PersonBloc bloc;
  BlocProvider({required this.bloc, required Widget child})
      : super(child: child);

  static PersonBloc get(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<BlocProvider>()!.bloc;
    if (provider != null) {
      return provider;
    } else {
      throw Exception("Not found bloc");
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as BlocProvider).bloc.state != bloc.state;
  }
}
