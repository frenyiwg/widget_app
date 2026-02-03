import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ColorChange extends ConsumerWidget {
  const ColorChange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedColorProvider);
    final isDark = ref.watch(isDarkProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Color Theme'),
        actions: [
          IconButton(
            onPressed: () => ref.read(isDarkProvider.notifier).state = !isDark,
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];

          return RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              ref.read(selectedColorProvider.notifier).state = index;
            },
          );
        },
      ),
    );
  }
}
