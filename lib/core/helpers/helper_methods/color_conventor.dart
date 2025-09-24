// Helper to convert hex string to Color.
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) {
    final hexCode = json.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  String toJson(Color color) =>
      '#${color.value.toRadixString(16).substring(2)}';
}
