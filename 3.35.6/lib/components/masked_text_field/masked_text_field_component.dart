import 'package:flutter/material.dart';

class MaskedTextFieldComponent extends StatelessWidget {
  MaskedTextFieldComponent({this.labelText, super.key});

  final String? labelText;
  final _visible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _visible,
      builder: (context, value, child) {
        return TextFormField(
          keyboardType: TextInputType.text,
          obscureText: !_visible.value,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: () => _visible.value = !_visible.value,
              child: Icon(
                _visible.value ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        );
      },
    );
  }
}
