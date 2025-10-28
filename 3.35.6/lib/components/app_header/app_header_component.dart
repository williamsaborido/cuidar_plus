import 'package:dener/util/app_text_styles.dart';
import 'package:dener/util/assets.dart';
import 'package:flutter/material.dart';

/// Cabeçalho do aplicativo com logo, título e botão de ação
class AppHeaderComponent extends StatelessWidget {
  /// Ação ao pressionar o botão de ação (voltar ou fechar)
  final VoidCallback? action;

  /// Indica se o botão de ação é de fechar (true) ou voltar (false)
  final bool close;

  /// Cria o cabeçalho do aplicativo com logo, título e botão de ação
  const AppHeaderComponent({this.action, this.close = false, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = AppTextStyles.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: action,
              icon: Icon(
                close ? Icons.close : Icons.arrow_back,
                size: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            
            Image.asset(Assets.companyLogo, height: 90),
          ],
        ),
        Text('Cadastre-se', style: textStyles.titleBlack),
      ],
    );
  }
}
