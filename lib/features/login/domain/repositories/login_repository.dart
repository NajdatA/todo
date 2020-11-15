import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> postLogin(
      String username, String password);
}
