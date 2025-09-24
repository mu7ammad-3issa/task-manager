import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:task_manager/core/helpers/helper_methods/color_conventor.dart';
part 'category_model.g.dart';

// Data model for a task category, updated to match the new API response.
@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  @ColorConverter()
  final Color color;
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'image_filter')
  final String imageFilter;
  @JsonKey(name: 'image_seed_offset')
  final int imageSeedOffset;

  CategoryModel({
    required this.id,
    required this.name,
    required this.color,
    required this.iconUrl,
    required this.createdAt,
    required this.imageFilter,
    required this.imageSeedOffset,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
