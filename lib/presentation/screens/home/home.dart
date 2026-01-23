import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
// import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final theme = Theme.of(context);
        final menuItem = appMenuItems[index];

        return ListTile(
          title: Text(menuItem.title),
          subtitle: Text(menuItem.subTitle),
          leading: Icon(menuItem.icon, color: theme.colorScheme.primary),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute<void>(
            //     builder: (context) => const ButtonsScreen(),
            //   ),
            // );

            // Navigator.pushNamed(context, menuItem.path);

            context.push(menuItem.path);
          },
        );
      },
    );
  }
}
