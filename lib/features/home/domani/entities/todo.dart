import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Todo extends Equatable {
  final int id;
  final String task;
  bool isFinished;
  final String date;

  Todo({@required this.id, @required this.task, @required this.isFinished, @required this.date})
      : super([id, task, isFinished, date]);
}