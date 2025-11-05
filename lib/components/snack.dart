 import 'package:flutter/material.dart';

void showSnack(BuildContext context, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? 'Operación realizada correctamente.' : 'Ocurrió un error.',
        ),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }