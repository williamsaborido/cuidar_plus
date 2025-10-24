import 'package:dener/util/fonts.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;

  const ButtonComponent({ required this.text, this.onPressed, super.key });

   @override
   Widget build(BuildContext context) {
       return Container(
        //padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(onPressed: onPressed, child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(text, style: Fonts.buttonBlack),
        )),
       );
  }
}