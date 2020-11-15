import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/home/domani/entities/todo.dart';
import 'package:flutter_app/features/home/domani/repositories/home_repository.dart';
import 'package:flutter_app/features/login/domain/repositories/login_repository.dart';

class AddTask implements UseCase<Todo, AddParams> {
  final HomeRepository repository;

  AddTask(this.repository);

  @override
  Future<Either<Failure, Todo>> call(params) async {
    return await repository.addTask(params.task);
  }
}

class AddParams extends Equatable {
  final String task;

  AddParams({this.task}) : super([task]);
}