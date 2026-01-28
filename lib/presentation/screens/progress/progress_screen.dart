import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress screen')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Circular progress'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black12,
          ),

          SizedBox(height: 20),
          Text('Linear progress'),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(seconds: 1),
        (value) => (value * 2) / 100,
      ).takeWhile((value) => value < 100),
      builder: (context, asyncSnapshot) {
        final progressValue = asyncSnapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: Colors.black12,
          ),
        );
      },
    );
  }
}
