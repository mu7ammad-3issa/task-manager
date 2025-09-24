// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      color: const ColorConverter().fromJson(json['color'] as String),
      iconUrl: json['icon_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      imageFilter: json['image_filter'] as String,
      imageSeedOffset: (json['image_seed_offset'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': const ColorConverter().toJson(instance.color),
      'icon_url': instance.iconUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'image_filter': instance.imageFilter,
      'image_seed_offset': instance.imageSeedOffset,
    };
