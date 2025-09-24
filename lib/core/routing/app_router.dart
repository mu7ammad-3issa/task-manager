import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/core/di/dependency_injectiond.dart';
import 'package:task_manager/features/tasks/logic/cubit/tasks_cubit.dart';
import 'package:task_manager/features/tasks/ui/screens/home_screen.dart';
import 'package:task_manager/features/tasks/ui/screens/task_details_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed to any screen like this {arguments as className}
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TasksCubit>()..loadTasksAndCategories(),
            child: const HomeScreen(),
          ),
          settings: settings,
        );
      case Routes.taskDetailsScreen:
        final args = arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TasksCubit>(),
            child: TaskDetailsScreen(
              task: args['task'],
              category: args['category'],
            ),
          ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
