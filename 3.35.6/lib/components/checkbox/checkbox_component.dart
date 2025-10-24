import 'package:dener/util/fonts.dart';
import 'package:flutter/material.dart';

class CheckboxComponent extends StatelessWidget {
  final _value = ValueNotifier<bool>(false);

  final String text;

  CheckboxComponent({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListenableBuilder(
          listenable: _value,
          builder: (_, _) {
            return Checkbox(
              value: _value.value,
              onChanged: (newValue) {
                _value.value = newValue ?? false;
              },
            );
          }
        ),
        Text(text, style: Fonts.regularBlack),
      ],
    );
  }
}
