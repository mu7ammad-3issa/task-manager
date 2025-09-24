import 'package:dio/dio.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';
import 'package:task_manager/features/tasks/data/models/category_model.dart';
import 'api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Categories endpoints
  @GET(ApiConstants.categoriesEndpoint)
  Future<List<CategoryModel>> getAllCategories({
    @Query('order') String? order = 'name.asc',
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET(ApiConstants.categoriesEndpoint)
  Future<List<CategoryModel>> getCategoryById(@Query('id') String id);

  // Tasks endpoints
  @GET(ApiConstants.tasksEndpoint)
  Future<List<TaskModel>> getAllTasks({
    @Query('order') String? order = 'created_at.desc',
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('category_id') String? categoryId,
    @Query('completed') String? completed,
    @Query('priority') String? priority,
  });

  @GET(ApiConstants.tasksEndpoint)
  Future<List<TaskModel>> getTaskById(@Query('id') String id);

  @POST(ApiConstants.tasksEndpoint)
  Future<List<TaskModel>> createTask(@Body() Map<String, dynamic> task);

  @PATCH(ApiConstants.tasksEndpoint)
  Future<List<TaskModel>> updateTask(
    @Query('id') String id,
    @Body() Map<String, dynamic> task,
  );

  @DELETE(ApiConstants.tasksEndpoint)
  Future<void> deleteTask(@Query('id') String id);
}
