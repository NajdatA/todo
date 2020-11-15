import 'package:moor_flutter/moor_flutter.dart';

class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get task => text()();
  BoolColumn get isFinished => boolean()();
}

enum TodoType { TYPE_TASK, TYPE_EVENT }