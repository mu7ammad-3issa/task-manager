import 'package:flutter/material.dart';
import 'package:task_manager/core/theming/app_styles.dart';
import 'package:task_manager/core/theming/colors_manager.dart';
import 'package:task_manager/features/tasks/ui/widgets/tasks_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks', style: AppStyles.h2),
        backgroundColor: ColorsManager.accentForeground,
      ),
      body: const TasksBlocBuilder(),
    );
  }
}
