import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

enum Priority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
}

@JsonSerializable()
class TaskModel {
  final int id;
  final String title;
  final String? description;
  final Priority priority;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'due_date')
  final String? dueDate;
  final bool completed;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.priority,
    required this.categoryId,
    this.dueDate,
    required this.completed,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
