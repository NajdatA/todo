import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const <dynamic>[]]) : super(props);
}

class GetTodosEvent extends HomeEvent {}
class UpdateEvent extends HomeEvent {
  final int id;
  final bool isFinished;
  final int index;

  UpdateEvent(this.id, this.isFinished, this.index);
}
class AddEvent extends HomeEvent {
  final String task;

  AddEvent(this.task);
}
