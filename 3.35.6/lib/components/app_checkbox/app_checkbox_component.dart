import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppCheckboxComponent extends StatelessWidget {
  final _value = ValueNotifier<bool>(false);
  final String text;

  AppCheckboxComponent({required this.text, super.key});

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
              },
            );
          }
        ),
        Text(text, style: textStyles.regularBlack),
      ],
    );
  }
}
