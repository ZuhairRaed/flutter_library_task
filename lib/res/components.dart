import 'package:flutter/material.dart';

class Components {
  static void errorDialog(BuildContext context, {String? text}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Error Occurs'),
          content: Text(
            text ?? 'Something wrong try again',
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
