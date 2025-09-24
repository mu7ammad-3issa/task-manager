import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_cubit.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_state.dart';
import 'package:task_manager/features/tasks/ui/widgets/tasks_list.dart';

class TasksBlocBuilder extends StatelessWidget {
  const TasksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      buildWhen: (previous, current) =>
          current is TasksLoading ||
          current is TasksSuccess ||
          current is TasksError,
      builder: (context, state) {
        return state.maybeWhen(
          tasksLoading: () => setupLoading(),
          tasksSuccess: (tasks, categories) => setupSuccess(tasks, categories),
          tasksError: (error) => setupError(error, context),
          orElse: () => setupLoading(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget setupSuccess(tasks, categories) {
    return const TasksList();
  }

  Widget setupError(String error, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64),
          const SizedBox(height: 16),
          const Text(
            'Error',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(error, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<TasksCubit>().loadTasksAndCategories();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
