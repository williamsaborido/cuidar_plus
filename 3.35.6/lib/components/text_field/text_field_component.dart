import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  const TextFieldComponent({this.labelText, this.onChanged, super.key});

  final String? labelText;
  final void Function(String)? onChanged;

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(controller.text);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.labelText,            
        border: OutlineInputBorder(),
      ),
    );
  }
}
