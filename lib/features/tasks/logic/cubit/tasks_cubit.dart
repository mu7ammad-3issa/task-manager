import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/core/networking/api_result.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';
import 'package:task_manager/features/tasks/data/models/category_model.dart';
import 'package:task_manager/features/tasks/data/repo/tasks_repo.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepo _tasksRepo;
  bool isUpdating = false;
  TasksCubit(this._tasksRepo) : super(const TasksState.tasksInitial());

  List<TaskModel> _allTasks = [];
  List<CategoryModel> _categories = [];

  List<TaskModel> get allTasks => _allTasks;
  List<CategoryModel> get categories => _categories;

  void loadTasksAndCategories() async {
    emit(const TasksState.tasksLoading());

    // Load categories first
    final categoriesResult = await _tasksRepo.getAllCategories();
    categoriesResult.when(
      success: (categories) async {
        _categories = categories;

        // Load tasks
        final tasksResult = await _tasksRepo.getAllTasks();
        tasksResult.when(
          success: (tasks) {
            _allTasks = tasks;
            emit(TasksState.tasksSuccess(_allTasks, _categories));
          },
          failure: (error) {
            emit(TasksState.tasksError(error));
          },
        );
      },
      failure: (error) {
        emit(TasksState.tasksError(error));
      },
    );
  }

  void refreshTasks() async {
    loadTasksAndCategories();
  }

  Future<void> toggleTaskCompletion(TaskModel task) async {
    if (isUpdating) return;

    isUpdating = true;
    emit(const TasksState.tasksLoading());

    final result = await _tasksRepo.updateTask(
      id: task.id.toString(),
      completed: !task.completed,
    );

    result.when(
      success: (updatedTasks) {
        final taskIndex = _allTasks.indexWhere((t) => t.id == task.id);
        if (taskIndex != -1 && updatedTasks.isNotEmpty) {
          _allTasks[taskIndex] = updatedTasks.first;
        }
        isUpdating = false;
        emit(TasksState.tasksSuccess(_allTasks, _categories));
      },
      failure: (error) {
        isUpdating = false;
        emit(TasksState.tasksError(error));
      },
    );
  }

  CategoryModel? getCategoryById(int categoryId) {
    try {
      return _categories.firstWhere((category) => category.id == categoryId);
    } catch (e) {
      return null;
    }
  }
}
