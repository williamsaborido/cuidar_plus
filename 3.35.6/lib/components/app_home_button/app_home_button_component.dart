import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppHomeButtonComponent extends StatelessWidget {
  final String labelText;
  final VoidCallback? onPressed;
  final IconData iconData;

  const AppHomeButtonComponent({
    required this.labelText,
    this.onPressed,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.of(context);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 3, color: Color(0xFFF6B3CF)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          spacing: 10,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData, color: Colors.black, size: 50),
            Expanded(
              child: Text(
                labelText,
                style: textStyle.buttonBlack,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
