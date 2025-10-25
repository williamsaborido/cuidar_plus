import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String? labelText;
  final bool masked;

  final _visible = ValueNotifier<bool>(false);

  TextFieldComponent({this.labelText, this.masked = false, super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _visible,
      builder: (context, _) {
        return TextFormField(
          obscureText: masked && !_visible.value,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            suffixIcon: masked
                ? GestureDetector(
                    onTap: () => _visible.value = !_visible.value,
                    child: Icon(
                      _visible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
