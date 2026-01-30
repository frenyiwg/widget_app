import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AppTutorialPage {
  final String imagePath;
  final String title;
  final String description;

  const AppTutorialPage({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final appTutorialPages = <AppTutorialPage>[
  AppTutorialPage(
    imagePath: 'assets/images/1.png',
    title: 'Bienvenido a Flutter',
    description: 'Aprende a usar Flutter con este tutorial.',
  ),
  AppTutorialPage(
    imagePath: 'assets/images/2.png',
    title: 'Widgets de Flutter',
    description: 'Explora los diferentes widgets disponibles en Flutter.',
  ),
  AppTutorialPage(
    imagePath: 'assets/images/3.png',
    title: 'Diseño de Interfaces',
    description: 'Crea interfaces de usuario atractivas con Flutter.',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool isEnd = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!isEnd && page >= appTutorialPages.length - 1.5) {
        setState(() {
          isEnd = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: appTutorialPages
                .map(
                  (slide) => _Slide(
                    title: slide.title,
                    subtitle: slide.description,
                    imagePath: slide.imagePath,
                  ),
                )
                .toList(),
          ),

          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Omitir'),
            ),
          ),

          isEnd
              ? Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: FadeInRight(
                      from: 15,
                      delay: Duration(seconds: 1),
                      child: FilledButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Iniciar'),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const _Slide({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final subtitleStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 16),
          Text(title, style: titleLarge),
          const SizedBox(height: 8),
          Text(subtitle, style: subtitleStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
