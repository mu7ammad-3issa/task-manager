import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/theming/app_styles.dart';
import 'package:task_manager/core/theming/colors_manager.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_cubit.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_state.dart';

class TaskActionBlocBuilder extends StatelessWidget {
  final TaskModel task;
  const TaskActionBlocBuilder({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      buildWhen: (previous, current) =>
          current is TasksLoading ||
          current is TasksSuccess ||
          current is TasksError,
      builder: (context, state) {
        return state.maybeWhen(
          tasksLoading: () {
            return setupLoading();
          },
          tasksSuccess: (tasks, categories) {
            return setupSuccess(context);
          },
          tasksError: (error) {
            return setupError(context);
          },
          orElse: () {
            return setupDefault(context);
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton.icon(
            onPressed: null,
            icon: Icon(
              task.completed ? Icons.undo : Icons.check,
              color: ColorsManager.primaryForeground,
            ),
            label: Text(
              task.completed ? 'Mark as Incomplete' : 'Mark as Complete',
              style: AppStyles.button,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: task.completed
                  ? ColorsManager.orange600
                  : ColorsManager.green600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget setupSuccess(BuildContext context) {
    return setupDefault(context);
  }

  Widget setupError(BuildContext context) {
    return setupDefault(context);
  }

  Widget setupDefault(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: context.read<TasksCubit>().isUpdating
            ? null
            : () => context.read<TasksCubit>().toggleTaskCompletion(task),
        style: ElevatedButton.styleFrom(
          backgroundColor: task.completed ? Colors.orange : Colors.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: context.read<TasksCubit>().isUpdating
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    task.completed ? Icons.undo : Icons.check_circle,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    task.completed ? 'Mark as Incomplete' : 'Mark as Complete',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
