import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider<bool>((ref) {
  return false;
});

final colorListProvider = Provider<List<Color>>((ref) {
  return listColor;
});

final selectedColorProvider = StateProvider<int>((ref) {
  return 0;
});
