// import 'package:chat/features/home/domain/usecases/get_consultations.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/features/home/data/datasources/home_db_source.dart';
import 'package:flutter_app/features/home/domani/usecases/add_task.dart';
import 'package:flutter_app/features/home/domani/usecases/get_todos.dart';
import 'package:flutter_app/features/home/domani/usecases/update_task.dart';
import 'package:flutter_app/features/login/data/datasources/login_local_data_source.dart';
import 'package:flutter_app/features/login/data/repositories/login_repositories_impl.dart';
import 'package:flutter_app/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_app/features/login/domain/usecases/login_user.dart';
import 'package:flutter_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'core/util/constants.dart';
import 'core/util/input_validator.dart';
import 'features/home/data/repositories/home_repositories_impl.dart';
import 'features/home/domani/repositories/home_repository.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
// import 'features/add/data/datasources/remote_add_data_source.dart';
// import 'features/add/data/repositories/add_repository_impl.dart';
// import 'features/add/domain/repositories/add_repository.dart';
// import 'features/add/domain/usecases/post_consultation.dart';
// import 'features/add/presentation/bloc/bloc.dart';
// import 'features/home/data/datasources/home_remote_data_source.dart';
// import 'features/home/data/repositories/home_repository_impl.dart';
// import 'features/home/domain/repositories/home_repository.dart';
// import 'features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final database = await initDb();
  sl.registerLazySingleton(() => database);

  // Bloc
  sl.registerFactory(
    () => HomeBloc(
      todos: sl(),
      add: sl(),
      update: sl(),
    ),
  );

  sl.registerFactory(
        () => LoginBloc(
      login: sl(),
      ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetTodos(sl()));
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => LoginUser(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
      db: sl(), networkInfo: sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      localDataSource: sl(), networkInfo: sl()));

  //! External
 final sharedPreferences = await SharedPreferences.getInstance();
 sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 200000,
          baseUrl: Endpoints.BASE_URL,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );
      return dio;
    },
  );
  sl.registerLazySingleton(() => DataConnectionChecker());

  //! Core
  sl.registerLazySingleton(() => InputValidator());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  sl.registerLazySingleton<HomeDb>(
    () => HomeDb(sl()),
  );
  sl.registerLazySingleton<LoginLocalDataSource>(
        () => LoginLocalDataSourceImpl(sharedPreferences: sl()),
  );
}
