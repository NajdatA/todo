import 'package:bloc/bloc.dart';
import 'package:flutter_app/core/usecases/usecase.dart';
import 'package:flutter_app/core/util/constants.dart';
import 'package:flutter_app/features/home/domani/usecases/add_task.dart';
import 'package:flutter_app/features/home/domani/usecases/get_todos.dart';
import 'package:flutter_app/features/home/domani/usecases/update_task.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTodos getTodos;
  final UpdateTask updateTask;
  final AddTask addTask;

  HomeBloc({GetTodos todos, UpdateTask update, AddTask add})
      : getTodos = todos,
        updateTask = update,
        addTask = add;

  @override
  HomeState get initialState => HomeState.initial();

  void todos() {
    dispatch(GetTodosEvent());
  }

  void update(int id, bool isFinished, int index) {
    dispatch(UpdateEvent(id, isFinished, index));
  }

  void add(String task) {
    dispatch(AddEvent(task));
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetTodosEvent) {
      yield* mapGetTodosEvent(event);
    } else if (event is AddEvent) {
      yield* mapAddEvent(event);
    } else if (event is UpdateEvent) {
      yield* mapUpdateEvent(event);
    }
  }

  Stream<HomeState> mapGetTodosEvent(GetTodosEvent event) async* {
    yield HomeState.loading(currentState);
    final failureOrTodos = await getTodos(NoParams());
    print('kkkk');
    yield failureOrTodos.fold((failure) {
      print('failed!');
      return HomeState.failure(FailureToMessage.getMessage(failure));
    }, (data) {
      print('add data $data');
      return currentState.rebuild((b) => b
        ..todos = data
        ..isLoading = false
        ..error = '');
    });
  }

  Stream<HomeState> mapAddEvent(AddEvent event) async* {
    yield HomeState.loading(currentState);
    print('soko');
    final failureOrAdd = await addTask(AddParams(task: event.task));
    print('kkkk');
    yield failureOrAdd.fold(
        (failure) => HomeState.failure(FailureToMessage.getMessage(failure)),
        (data) => currentState.rebuild((b) => b
          ..isAddSuccess = true
          ..isLoading = false
          ..error = ''));
  }

  Stream<HomeState> mapUpdateEvent(UpdateEvent event) async* {
    yield HomeState.loading(currentState);
    final failureOrUpdate = await updateTask(
        UpdateParams(id: event.id, isFinished: event.isFinished));
    print('kkkk');
    todos();
    // yield failureOrUpdate.fold((failure) {
    //   print('fail');
    //   return currentState.rebuild((builder) => builder
    //     // ..todos[event.index].isFinished = event.isFinished
    //     ..error = '');
    // }, (data) {
    //   print('success');
    //   return currentState.rebuild((b) => b
    //     // ..todos[event.index].isFinished = event.isFinished
    //     ..isLoading = false
    //     ..error = '');
    // });
  }
}
