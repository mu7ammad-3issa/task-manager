import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/helpers/base_extensions/context/navigation.dart';
import 'package:task_manager/core/helpers/base_extensions/context/padding.dart';
import 'package:task_manager/core/helpers/helper_methods/spacing.dart';
import 'package:task_manager/core/theming/app_styles.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_cubit.dart';
import 'package:task_manager/features/tasks/ui/widgets/task_card.dart';
import 'package:task_manager/core/routing/routes.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasksCubit>();
    final tasks = cubit.allTasks;

    if (tasks.isEmpty) {
      return Center(child: Text('No tasks found', style: AppStyles.p));
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TasksCubit>().loadTasksAndCategories();
      },
      child: ListView.separated(
        padding: context.all(16.w),
        itemCount: tasks.length,
        separatorBuilder: (context, index) => verticalSpace(12),
        itemBuilder: (context, index) {
          final task = tasks[index];
          final category = cubit.getCategoryById(task.categoryId);

          return TaskCard(
            task: task,
            category: category,
            onClick: () {
              context.pushNamed(
                Routes.taskDetailsScreen,
                arguments: {'task': task, 'category': category},
              );
            },
          );
        },
      ),
    );
  }
}
