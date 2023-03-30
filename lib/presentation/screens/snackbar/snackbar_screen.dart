import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola Mundo'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Ok!',
          onPressed: () {},
        ),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
          'Proident sit occaecat cupidatat fugiat Lorem et laborum fugiat. Minim ut esse sunt amet consequat est qui. Id ut reprehenderit in ullamco sint excepteur mollit magna eiusmod enim enim proident Lorem commodo. Ea eiusmod quis aliqua laboris amet do elit. Laborum nisi elit ut Lorem deserunt ullamco commodo cupidatat et id reprehenderit consectetur qui amet.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: <Widget>[
                    const Text(
                      'Amet mollit voluptate amet ex non dolor duis esse excepteur ut ex. Deserunt culpa ex anim sunt laboris enim commodo commodo ut et esse qui aute. Veniam do ex ullamco est dolor aliquip sit officia.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
