import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppConfirmDialog extends StatelessWidget {
final String message;
final String? title;

  const AppConfirmDialog({ required this.message, this.title, super.key });

   @override
   Widget build(BuildContext context) {
       return AlertDialog(
          title: Text(title == null ? 'Cuidar +' : title!, style: AppTextStyles.of(context).titleBlack),
          content: Text(message, style: AppTextStyles.of(context).regularBlack),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Confirmar'),
            ),
          ],
        );
  }
}