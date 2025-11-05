import 'package:flutter/material.dart';

/// Campo de texto estilizado com bordas inferiores arredondadas
class AppTextFieldComponent extends StatelessWidget {
  /// Texto do rótulo do campo
  final String? labelText;
  
  /// Indica se o campo é de senha (oculta o texto)
  final bool masked;

  /// Ícone indicativo no final do campo de texto
  final Widget? suffix;

  final _visible = ValueNotifier<bool>(false);

  final _border = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Color(0xFF000000), width: 5),
  );

  /// Cria um campo de texto estilizado com bordas inferiores arredondadas
  AppTextFieldComponent({this.labelText, this.masked = false, this.suffix, super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _visible,
      builder: (context, _) {
        return TextFormField(
          obscureText: masked && !_visible.value,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: labelText,
            border: _border,
            focusedBorder: _border,
            enabledBorder: _border,
            suffixIcon: masked 
            ? GestureDetector(
              onTap: () => _visible.value = !_visible.value,
              child: Icon(_visible.value ? Icons.visibility : Icons.visibility_off),
            )
            : suffix,
          ),
        );
      }
    );
  }
}
