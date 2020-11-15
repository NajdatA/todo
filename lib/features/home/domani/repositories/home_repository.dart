import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/features/home/domani/entities/todo.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Todo>>> getTodo();
  Future<Either<Failure, Todo>> addTask(String task);
  Future<Either<Failure, Todo>> updateTask(int id, bool isFinished);
}
