import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/helpers/base_extensions/context/padding.dart';
import 'package:task_manager/core/theming/app_styles.dart';
import 'package:task_manager/core/theming/colors_manager.dart';
import 'package:task_manager/features/tasks/data/models/category_model.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';

class CustomBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CustomBadge({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  factory CustomBadge.category(CategoryModel category) {
    return CustomBadge(
      text: category.name,
      backgroundColor: category.color.withOpacity(0.2),
      textColor: category.color,
    );
  }

  factory CustomBadge.priority(Priority priority) {
    Color color;
    switch (priority) {
      case Priority.high:
        color = ColorsManager.red700;
        break;
      case Priority.medium:
        color = ColorsManager.orange600;
        break;
      case Priority.low:
        color = ColorsManager.green600;
        break;
    }

    return CustomBadge(
      text: priority.name.toUpperCase(),
      backgroundColor: color.withOpacity(0.2),
      textColor: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: AppStyles.extraSmallText.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
