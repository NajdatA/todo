library login_state;

import 'package:built_value/built_value.dart';

part 'login_state.g.dart';

abstract class LoginState
    implements Built<LoginState, LoginStateBuilder> {

  bool get isLoading;

  bool get success;

  String get error;

  bool get fail;

  // bool get wait;

  bool get isInitial => !isLoading && !success && error == '';

  bool get isSuccessful => !isLoading && success && error == '';

  LoginState._();

  factory LoginState([updates(LoginStateBuilder b)]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState((b) =>
    b
      ..isLoading = false
      ..error = ''
      // ..wait = false
      ..success = false
      ..fail = false);
  }

  factory LoginState.loading() {
    return LoginState((b) =>
    b
      ..isLoading = true
      ..success = false
      // ..wait = false
      ..fail = false
      ..error = '');
  }

  factory LoginState.failure(String error) {
    return LoginState((b) =>
    b
      ..isLoading = false
      ..success = false
      ..fail = true
      // ..wait = true
      ..error = error);
  }

  factory LoginState.success() {
    return LoginState((b) =>
    b
      ..isLoading = false
      ..success = true
      // ..wait = true
      ..fail = false
      ..error = '');
  }
}