import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
// import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
// import 'package:widgets_app/presentation/screens/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 5).getTheme(),
      routerConfig: routerConfig,
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },
    );
  }
}
