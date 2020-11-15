import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/home/domani/entities/todo.dart';
import 'package:flutter_app/features/home/domani/repositories/home_repository.dart';

class UpdateTask implements UseCase<Todo, UpdateParams> {
  final HomeRepository repository;

  UpdateTask(this.repository);

  @override
  Future<Either<Failure, Todo>> call(params) async {
    return await repository.updateTask(params.id, params.isFinished);
  }
}

class UpdateParams extends Equatable {
  final int id;
  final bool isFinished;

  UpdateParams({this.id, this.isFinished}) : super([id, isFinished]);
}