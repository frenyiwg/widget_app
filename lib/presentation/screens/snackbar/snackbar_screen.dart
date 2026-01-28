import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Hello, this is a snackbar!'),
        action: SnackBarAction(label: 'OK!', onPressed: () {}),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar screen')),
      body: _SnackbarView(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Show Snackbar'),
        icon: Icon(Icons.info_outline),
        onPressed: () {
          showSnackbar(context);
        },
      ),
    );
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView();

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Custom Modal'),
        content: Text('Contenido del custom modal '),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Licencias usadas',
                children: [Text('Contenido de las licencias')],
              );
            },
            child: Text('Licencias usadas'),
          ),
          FilledButton.tonal(
            onPressed: () {
              showModal(context);
            },
            child: Text('Dialogos'),
          ),
        ],
      ),
    );
  }
}
