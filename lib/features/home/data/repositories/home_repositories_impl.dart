import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/features/home/data/datasources/home_db_source.dart';
import 'package:flutter_app/features/home/domani/entities/todo.dart';
import 'package:flutter_app/features/home/domani/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDb db;
  // BaseLocalDataSource localDataSource;
  NetworkInfo networkInfo;

  HomeRepositoryImpl({
    @required this.db,
    // @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Todo>>> getTodo() async {
    print('getTODO');
    final list = await db.getTodoTasks();
    final result = list
        .map(
          (task) => Todo(
        id: task['id'],
        task: task['task'],
        date: task['date'],
        isFinished: task['is_finished'] == 1,
      ),
    )
        .toList();
    print('result is $result');
    return Right(result);
  }

  @override
  Future<Either<Failure, Todo>> addTask(String task) async {
    print('task in repo is $task');
    final todo = await db.insertTask(
      task: task,
    );
    print('todo is $todo');
    final result = Todo(id: todo['id'], task: todo['task'], isFinished: todo['is_finished'], date: todo['date']);
    print('hohoho $todo');
    print('hohoho $result');
    if (todo != null)
      return Right(result);
    else
      return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Todo>> updateTask(
    int id,
    bool isFinished,
  ) async {
    final task =
    await db.updateTask(id: id, isFinished: isFinished);
    final result = Todo(
      id: task['id'],
      task: task['task'],
      date: task['date'],
      isFinished: task['is_finished'] == 1,
    );
    print('hoho $task');
    print('hoho ${result.task}');
    if (task != null)
      return Right(Todo(
        id: task['id'],
        task: task['task'],
        date: task['date'],
        isFinished: task['is_finished'] == 1,
      ));
    else {
      return Left(ServerFailure());
    }
  }

}