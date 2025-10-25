import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppButtonComponent({required this.text, this.onPressed, super.key});

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
          child: Text(text, style: textStyles.buttonBlack),
        ),
      ),
    );
  }
}
