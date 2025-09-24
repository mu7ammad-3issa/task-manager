import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:task_manager/core/helpers/base_extensions/context/padding.dart';
import 'package:task_manager/core/helpers/helper_methods/spacing.dart';
import 'package:task_manager/core/theming/app_styles.dart';
import 'package:task_manager/core/theming/colors_manager.dart';
import 'package:task_manager/core/widgets/custom_badge.dart';
import 'package:task_manager/features/tasks/data/models/category_model.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final CategoryModel? category;
  final VoidCallback onClick;

  const TaskCard({
    super.key,
    required this.task,
    this.category,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: task.completed ? 0.6 : 1.0,
      child: Material(
        color: ColorsManager.card,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onClick,
          child: Container(
            padding: context.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: ColorsManager.border),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Thumbnail(imageUrl: task.imageUrl),
                horizontalSpace(12),
                _TaskInfo(task: task, category: category),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final String imageUrl;
  const _Thumbnail({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 48.w,
        height: 48.w,
        fit: BoxFit.cover,
        placeholder: (_, __) => Container(color: ColorsManager.gray100),
        errorWidget: (_, __, ___) => Container(
          color: ColorsManager.gray100,
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}

class _TaskInfo extends StatelessWidget {
  final TaskModel task;
  final CategoryModel? category;

  const _TaskInfo({required this.task, this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: AppStyles.cardTitle.copyWith(
              decoration: task.completed ? TextDecoration.lineThrough : null,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(8),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              if (category != null) CustomBadge.category(category!),
              CustomBadge.priority(task.priority),
            ],
          ),
        ],
      ),
    );
  }
}
