import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';

typedef EitherOr<T> = Either<Failure, T> Function(String);

class InputValidator {
  Either<Failure, String> checkPassword(String password) {
    try {
      if (password.length < 8) throw FormatException();
      return Right(password);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }

  Either<Failure, String> checkNumber(String number) {
    try {
      if (number.length == 10 && number.startsWith("09")) return Right(number);
      throw FormatException();
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }

  Either<Failure, String> checkName(String name) {
    try {
      if (name.length > 2) return Right(name);
      throw FormatException();
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
