import 'package:task_manager/core/networking/api_error_handler.dart';
import 'package:task_manager/core/networking/api_result.dart';
import 'package:task_manager/core/networking/api_service.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';
import 'package:task_manager/features/tasks/data/models/category_model.dart';

class TasksRepo {
  final ApiService _apiService;
  TasksRepo(this._apiService);

  // Categories methods
  Future<ApiResult<List<CategoryModel>>> getAllCategories() async {
    try {
      final response = await _apiService.getAllCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // Tasks methods
  Future<ApiResult<List<TaskModel>>> getAllTasks({
    int? limit,
    int? offset,
    String? categoryId,
    bool? completed,
    String? priority,
  }) async {
    try {
      final response = await _apiService.getAllTasks(
        limit: limit,
        offset: offset,
        categoryId: categoryId != null ? 'eq.$categoryId' : null,
        completed: completed != null ? 'eq.$completed' : null,
        priority: priority != null ? 'eq.$priority' : null,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<TaskModel>>> getTaskById(String id) async {
    try {
      final response = await _apiService.getTaskById('eq.$id');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<TaskModel>>> createTask({
    required String title,
    required int categoryId,
    String? description,
    String? priority = 'medium',
    String? dueDate,
    String? imageUrl,
  }) async {
    try {
      final taskData = <String, dynamic>{
        'title': title,
        'category_id': categoryId,
        if (description != null) 'description': description,
        if (priority != null) 'priority': priority,
        if (dueDate != null) 'due_date': dueDate,
        if (imageUrl != null) 'image_url': imageUrl,
      };
      final response = await _apiService.createTask(taskData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<TaskModel>>> updateTask({
    required String id,
    String? title,
    String? description,
    String? priority,
    String? dueDate,
    bool? completed,
  }) async {
    try {
      final taskData = <String, dynamic>{};
      if (title != null) taskData['title'] = title;
      if (description != null) taskData['description'] = description;
      if (priority != null) taskData['priority'] = priority;
      if (dueDate != null) taskData['due_date'] = dueDate;
      if (completed != null) taskData['completed'] = completed;

      final response = await _apiService.updateTask('eq.$id', taskData);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteTask(String id) async {
    try {
      await _apiService.deleteTask('eq.$id');
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
