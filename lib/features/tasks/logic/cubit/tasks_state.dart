import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/features/tasks/data/models/category_model.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';
part 'tasks_state.freezed.dart';

@freezed
class TasksState<T> with _$TasksState<T> {
  const factory TasksState.tasksInitial() = _TasksInitial;
  const factory TasksState.tasksLoading() = TasksLoading;
  const factory TasksState.tasksSuccess(
    List<TaskModel> allTasks,
    List<CategoryModel> categories,
  ) = TasksSuccess;
  const factory TasksState.tasksError(String error) = TasksError;
}
