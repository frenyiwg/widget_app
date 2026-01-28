import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100;
  double height = 100;
  Color color = Colors.blue;
  double radius = 20;

  void changeShape() {
    setState(() {
      width = Random().nextInt(300) + 100;
      height = Random().nextInt(300) + 100;
      color = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
      radius = Random().nextDouble() * 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          height: height <= 0 ? 100 : height,
          width: width <= 0 ? 100 : width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius <= 0 ? 0 : radius),
          ),
        ),
      ),
    );
  }
}
