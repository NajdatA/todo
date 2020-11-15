import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class LoginUserEvent extends LoginEvent {

  final String username;

  final String password;

  LoginUserEvent(this.username, this.password) : super([username, password]);
}

class ClearEvent extends LoginEvent {}