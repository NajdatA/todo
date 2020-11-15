library home_state;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_app/features/home/domani/entities/todo.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  @nullable
  List<Todo> get todos;

  bool get isAddSuccess;

  bool get isLoading;

  bool get success;

  String get error;

  HomeState._();

  factory HomeState([updates(HomeStateBuilder b)]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..isLoading = false
      ..success = false
      ..isAddSuccess = false
      ..todos = []
      ..error = '');
  }

  factory HomeState.loading(HomeState currentState) {
    return currentState.rebuild((b) => b
      ..isLoading = true
      ..success = false
      ..todos = []
      ..error = '');
  }

  factory HomeState.failure(String error) {
    print('error is $error');
    return HomeState((b) => b
      ..isLoading = false
      ..isAddSuccess = false
      ..success = false
      ..todos = []
      ..error = error);
  }
}
