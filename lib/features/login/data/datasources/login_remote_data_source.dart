import 'dart:convert';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/network/models/base_response_model.dart';
import 'package:flutter_app/core/util/constants.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';


abstract class UserRemoteDataSource {
  Future<bool> login(String username, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl(
      {@required this.dio});

  @override
  Future<bool> login(
      String username, String password) async {
    try {
      final formData = RequestBody.login(
        email: 'example@gmail.com',
        password: password,
        fcmToken: 'fcmToken',
      );
      final response = await dio.post(
        Endpoints.LOGIN,
        data: formData,
        options: OPTION,
      );
      if (response.statusCode == 200) {
        final BaseResponseModel<bool> finalResponse =
        BaseResponseModel<bool>.fromJson(json.decode(response.data));
        if (finalResponse.data != null) {
          return finalResponse.data;
        } else {
          print('e is error');
          throw ServerException();
        }
      } else {
        print('e is error');
        throw ServerException();
      }
    } catch (e) {
      print('e is $e');
      throw ServerException();
    }
  }
}
