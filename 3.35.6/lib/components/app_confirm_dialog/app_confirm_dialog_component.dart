import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Diálogo de confirmação com botão 'Cancelar' e outro 'Confirmar', usado para solicitar uma comfirmação ao usuário
/// Usado em conjunto com a função 'confirm' da classe [BaseState]
class AppConfirmDialogComponent extends StatelessWidget {
/// Mensagem, ou pergunta, a ser exibida ao usuário
final String message;

/// Título do diálogo (por padrão, é a string 'Cuidar +')
final String? title;

  /// Cria um diálogo de confirmação com botão 'Cancelar' e outro 'Confirmar', usado para solicitar uma comfirmação ao usuário
  /// Usado em conjunto com a função 'confirm' da classe [BaseState]
  const AppConfirmDialogComponent({ required this.message, this.title, super.key });

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