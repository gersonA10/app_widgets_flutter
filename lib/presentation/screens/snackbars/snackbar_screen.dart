import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const path = '/snackbar';
  static const name = 'snackbar';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      backgroundColor: Colors.indigo,
      content: const Text('Dialogo Mostrado Correctamente'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialg(BuildContext context) {
    showAdaptiveDialog(
       barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: const Text('Actualizado Correctamente'),
            content: const Text('Ut aute incididunt adipisicing amet qui pariatur deserunt.'),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Aceptar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              onPressed: () {
                //Quiero abrir un dialogo (un snackbar)
                showCustomSnackBar(context);
              },
              child: const Text("Mostrar Snackbar Personalizado"),
            ),
            FilledButton.tonal(
              onPressed: () {
                //Quiero abrir un dialogo (un snackbar)
                showAboutDialog(context: context, children: [
                  const Text(
                      'Aute commodo ullamco proident officia consequat exercitation eu non ea pariatur voluptate sit incididunt et.')
                ]);
              },
              child: const Text("Mostrar Dialog"),
            ),
            FilledButton.tonal(
              onPressed: () {
                //Quiero abrir un dialogo (un snackbar)
                openDialg(context);
              },
              child: const Text("Mostrar Dialogo Completo"),
            )
          ],
        ),
      ),
    );
  }
}
