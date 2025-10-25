import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppFormButtonComponent extends StatelessWidget {
  final String labelText;
  final VoidCallback? onTap;

  const AppFormButtonComponent({
    required this.labelText,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,        
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFFFAD5E3),
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 10),
          side: BorderSide(color: Color(0xFFF6B3CF), width: 3),
        ),
        child: Text(labelText, style: AppTextStyles.of(context).buttonBlack),
      ),
    );
  }
}
