import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
            TextButton(onPressed: () {}, child: Text('Text Button')),
            OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
            FilledButton(onPressed: () {}, child: Text('Filled Button')),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(theme.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
