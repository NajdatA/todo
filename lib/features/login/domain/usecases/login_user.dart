import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/features/login/domain/repositories/login_repository.dart';

class LoginUser implements UseCase<bool, LoginParams> {
  final LoginRepository repository;

  LoginUser(this.repository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.postLogin(params.username, params.password);
  }
}

class LoginParams extends Equatable {

  final String username;
  final String password;

  LoginParams(
      {this.username, this.password})
      : super([username, password]);
}