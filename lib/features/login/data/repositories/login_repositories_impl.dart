import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/features/login/data/datasources/login_local_data_source.dart';
import 'package:flutter_app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  // LoginRemoteDataSource remoteDataSource;
  LoginLocalDataSource localDataSource;
  NetworkInfo networkInfo;

  LoginRepositoryImpl({
    // @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> postLogin(
      String username, String password) async {
    // return checkNetwork(() async {
      try {
        // Normally I go through remote data source through this function to access the API
        // final result = await remoteDataSource.login(email, password, fcmToken);

        // Since this is a test so this is how I'll check
        if (username == 'najdat' && password == '00000000') {
          await localDataSource.updateUser(
              username);
          return Right(true);
        } else {
          return Left(ServerFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    // });
  }
}