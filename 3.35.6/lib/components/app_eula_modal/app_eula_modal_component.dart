import 'package:dener/components/app_button/app_button_component.dart';
import 'package:dener/components/app_checkbox/app_checkbox_component.dart';
import 'package:dener/util/app_text_styles.dart';
import 'package:dener/util/assets.dart';
import 'package:dener/util/base_state.dart';
import 'package:dener/util/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Caixa de diálogo com os termos de uso para o usuário final (EULA)
class AppEulaModalComponent extends StatefulWidget {
  /// Cria uma caixa de diálogo com os termos de uso para o usuário final (EULA)
  const AppEulaModalComponent({super.key});

  @override
  State<AppEulaModalComponent> createState() => _AppEulaModalComponentState();
}

class _AppEulaModalComponentState extends BaseState<AppEulaModalComponent> {
  final eulaText = ValueNotifier<String>('');

  bool accept = false;

  @override
  onInit() {
    rootBundle
        .loadString(Assets.termsAndConditions)
        .then((value) => eulaText.value = value);
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = AppTextStyles.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListenableBuilder(
        listenable: eulaText,
        builder: (context, _) {
          return Column(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Termos e condições', style: textStyles.titleBlack),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Text(eulaText.value, style: textStyles.regularBlack),
                  ],
                ),
              ),
              Visibility(
                visible: eulaText.value.isNotEmpty,
                child: AppCheckboxComponent(
                  labelText: 'Concordo com os termos e condições do App',
                  value: accept,
                  onChanged: (value) => accept = value,
                ),
              ),
              Visibility(
                visible: eulaText.value.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButtonComponent(
                      labelText: 'Confirmar',
                      onPressed: () {
                        if (accept){
                          navigateBack();
                        }
                        else {
                          alert('Você precisa aceitar os termos para continuar.');
                        }                          
                      },
                    ),
                    AppButtonComponent(
                      labelText: 'Cancelar',
                      onPressed: () => NavigatorKey.instance.logoff(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
