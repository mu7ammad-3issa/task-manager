import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager/core/networking/api_service.dart';
import 'package:task_manager/core/networking/dio_factory.dart';
import 'package:task_manager/features/tasks/data/repo/tasks_repo.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Tasks
  getIt.registerLazySingleton<TasksRepo>(() => TasksRepo(getIt()));
  getIt.registerFactory<TasksCubit>(() => TasksCubit(getIt()));
}
