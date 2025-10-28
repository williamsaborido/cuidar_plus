import 'package:flutter/material.dart';

/// Campo de texto (padrão Material/Android)
class TextFieldComponent extends StatelessWidget {
  /// Texto do rótulo do campo
  final String? labelText;

  /// Indica se o campo é de senha (oculta o texto)
  final bool masked;

  final _visible = ValueNotifier<bool>(false);

  /// Cria um campo de texto (padrão Material/Android)
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
