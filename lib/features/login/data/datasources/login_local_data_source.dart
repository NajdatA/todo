import 'package:flutter_app/core/util/constants.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<bool> updateUser(String username);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<bool> updateUser(String username) async {
    await sharedPreferences.setString(SharedPreferencesKeys.USERNAME, username);
    return true;
  }
}