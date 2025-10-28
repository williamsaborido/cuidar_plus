import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Botão estilizado com borda arredondada
class AppButtonComponent extends StatelessWidget {
  /// Texto do botão  
  final String labelText;

  /// Ação ao pressionar o botão
  final VoidCallback? onPressed;

  /// Cria um botão estilizado com borda arredondada
  const AppButtonComponent({required this.labelText, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = AppTextStyles.of(context);
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(labelText, style: textStyles.buttonBlack),
        ),
      ),
    );
  }
}
