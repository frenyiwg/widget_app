import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int optionSelected = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: optionSelected,
      onDestinationSelected: (value) {
        setState(() {
          optionSelected = value;
        });

        final option = appMenuItems[value];
        context.push(option.path);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 16, 10),
          child: Text('Main options'),
        ),

        ...appMenuItems.sublist(0, 3).map((menuItem) {
          return NavigationDrawerDestination(
            icon: Icon(menuItem.icon),
            label: Text(menuItem.title),
          );
        }),

        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 16, 10),
          child: Divider(),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 16, 10),
          child: Text('Otras Opciones'),
        ),

        ...appMenuItems.sublist(3, appMenuItems.length).map((menuItem) {
          return NavigationDrawerDestination(
            icon: Icon(menuItem.icon),
            label: Text(menuItem.title),
          );
        }),
      ],
    );
  }
}
