import 'package:flutter/material.dart';

/// Botão que indica se a captura foi feita indicando com um ícone a esquerda
class AppCaptureButton extends StatefulWidget {
  /// Texto do rótulo do botão
  final String textLabel;

  /// Ícone indicativo do tipo de dado a ser capturado
  final IconData icon;

  /// Função que retorna um booleano para alterar o estado entre 'preenchido' e 'pendente'
  final bool Function() onTap;

  /// Cria um botão que indica se a captura foi feita indicando com um ícone a esquerda
  const AppCaptureButton({
    required this.textLabel,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  State<AppCaptureButton> createState() => _AppCaptureButtonState();
}

class _AppCaptureButtonState extends State<AppCaptureButton> {
  final ready = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        ListenableBuilder(
          listenable: ready,
          builder: (context, _) {
            return Icon(
              ready.value ? Icons.verified : Icons.remove_circle_outline,
              color: ready.value ? Colors.green : Colors.grey,
            );
          },
        ),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => ready.value = widget.onTap(),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: BoxBorder.fromLTRB(bottom: BorderSide(width: 5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(widget.textLabel), Icon(widget.icon)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
