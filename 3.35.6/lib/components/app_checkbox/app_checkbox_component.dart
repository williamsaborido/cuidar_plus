import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Checkbox (seleção de opções) com um texto explicativo
class AppCheckboxComponent extends StatefulWidget {
  /// Texto do rótulo do campo
  final String labelText;

  /// Valor inicial do checkbox
  final bool value;

  /// Função que reage a mudanças no valor do checkbox (geralmente ao clicar)
  final void Function(bool)? onChanged;

  /// Cria um checkbox (seleção de opções) com um texto explicativo
  const AppCheckboxComponent({required this.labelText, this.onChanged, this.value = false, super.key});

  @override
  State<AppCheckboxComponent> createState() => _AppCheckboxComponentState();
}

class _AppCheckboxComponentState extends State<AppCheckboxComponent> {
  final _value = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _value.value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = AppTextStyles.of(context);
    return Row(
      children: [
        ListenableBuilder(
          listenable: _value,
          builder: (_, _) {
            return Checkbox(
              value: _value.value,
              onChanged: (newValue) {
                _value.value = newValue ?? false;
                widget.onChanged?.call(_value.value);
              },
            );
          }
        ),
        Flexible(child: Text(widget.labelText, style: textStyles.regularBlack)),
      ],
    );
  }
}
