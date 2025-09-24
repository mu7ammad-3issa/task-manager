import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:task_manager/core/helpers/helper_methods/spacing.dart';
import 'package:task_manager/core/helpers/base_extensions/context/padding.dart';
import 'package:task_manager/core/theming/app_styles.dart';
import 'package:task_manager/core/theming/colors_manager.dart';
import 'package:task_manager/core/widgets/custom_badge.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';
import 'package:task_manager/features/tasks/data/models/category_model.dart';

import 'package:task_manager/features/tasks/ui/widgets/task_action_bloc_builder.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskModel task;
  final CategoryModel? category;

  const TaskDetailsScreen({super.key, required this.task, this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.white),
        title: Text('Task Details', style: AppStyles.h2),
        backgroundColor: ColorsManager.accentForeground,
      ),
      body: SingleChildScrollView(
        padding: context.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TaskImage(imageUrl: task.imageUrl),
            verticalSpace(24),
            _TaskHeader(task: task, category: category),
            verticalSpace(24),
            _TaskDescription(description: task.description),
            verticalSpace(24),
            _TaskDetails(task: task),
            verticalSpace(32),
            TaskActionBlocBuilder(task: task),
          ],
        ),
      ),
    );
  }
}

class _TaskImage extends StatelessWidget {
  final String imageUrl;

  const _TaskImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManager.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (_, __) => Container(
            color: ColorsManager.gray100,
            child: const Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (_, __, ___) => Container(
            color: ColorsManager.gray100,
            child: const Center(child: Icon(Icons.error, size: 48)),
          ),
        ),
      ),
    );
  }
}

class _TaskHeader extends StatelessWidget {
  final TaskModel task;
  final CategoryModel? category;

  const _TaskHeader({required this.task, this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: AppStyles.h1.copyWith(
            color: ColorsManager.primary,
            decoration: task.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        verticalSpace(12),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            if (category != null) CustomBadge.category(category!),
            CustomBadge.priority(task.priority),
            if (task.completed)
              Container(
                padding: context.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorsManager.green100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'COMPLETED',
                  style: AppStyles.extraSmallText.copyWith(
                    color: ColorsManager.green700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _TaskDescription extends StatelessWidget {
  final String? description;

  const _TaskDescription({this.description});

  @override
  Widget build(BuildContext context) {
    if (description == null || description!.isEmpty) {
      return Container(
        padding: context.all(16.w),
        decoration: BoxDecoration(
          color: ColorsManager.gray100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          'No description provided',
          style: AppStyles.p.copyWith(
            color: ColorsManager.mutedForeground,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: AppStyles.h3),
        verticalSpace(8),
        Container(
          width: double.infinity,
          padding: context.all(16.w),
          decoration: BoxDecoration(
            color: ColorsManager.card,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: ColorsManager.border),
          ),
          child: Text(description!, style: AppStyles.p),
        ),
      ],
    );
  }
}

class _TaskDetails extends StatelessWidget {
  final TaskModel task;

  const _TaskDetails({required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Details', style: AppStyles.h3),
        verticalSpace(12),
        _DetailRow(context, 'Priority', task.priority.name.toUpperCase()),
        if (task.dueDate != null)
          _DetailRow(context, 'Due Date', task.dueDate!),
        _DetailRow(context, 'Created', _formatDate(task.createdAt)),
        _DetailRow(context, 'Updated', _formatDate(task.updatedAt)),
      ],
    );
  }

  Widget _DetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: context.bottom(8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              '$label:',
              style: AppStyles.smallText.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value, style: AppStyles.smallText)),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
