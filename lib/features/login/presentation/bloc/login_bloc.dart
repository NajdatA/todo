import 'package:bloc/bloc.dart';
import 'package:flutter_app/features/login/domain/usecases/login_user.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  void login(String username, password) async {
    dispatch(LoginUserEvent(username, password));
  }

  void clear() async {
    dispatch(ClearEvent());
  }

  LoginBloc({
    LoginUser login,
  }) : loginUser = login;

  @override
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    if (event is LoginUserEvent)
      yield* mapLoginEvent(event);
    else if (event is ClearEvent) {
      yield currentState.rebuild((builder) => builder
      ..error = '');
    }
  }

  Stream<LoginState> mapLoginEvent(LoginUserEvent e) async* {
    yield LoginState.loading();
    final failureOrLogin = await loginUser(LoginParams(
        username: e.username,
        password: e.password));
    yield failureOrLogin.fold((failure) {
      print('failed');
      return LoginState.failure('something went wrong');
    }, (login) {
      print('success');
      return LoginState.success();
    });
  }
}
