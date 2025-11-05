import 'package:dener/components/app_form_button/app_form_button.component.dart';
import 'package:dener/components/app_header/app_header_component.dart';
import 'package:dener/components/app_eula_modal/app_eula_modal_component.dart';
import 'package:dener/components/app_text_field/app_text_field_component.dart';
import 'package:dener/util/base_state.dart';
import 'package:dener/util/navigator_key.dart';
import 'package:flutter/material.dart';

/// Formulário de cadastro do doador
class DonatorSignupForm extends StatefulWidget {
  /// Cria o formulário de cadastro do doador
  const DonatorSignupForm({super.key});

  @override
  State<DonatorSignupForm> createState() => _DonatorSignupFormState();
}

class _DonatorSignupFormState extends BaseState<DonatorSignupForm> {

  @override
  onInit() {    
    showModal(AppEulaModalComponent(), dismissible: false);      
  }

  void close() {
    confirm('Deseja cancelar o processo de cadastro?')
    .then((cancel){
      if (cancel){
        NavigatorKey.instance.logoff();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              AppHeaderComponent(action: close, labelText: 'Cadastre-se', close: true),
              AppTextFieldComponent(labelText: 'Nome completo'),
              AppTextFieldComponent(labelText: 'E-mail'),
              AppTextFieldComponent(labelText: 'Confirmar e-mail'),
              AppTextFieldComponent(labelText: 'CPF'),
              AppTextFieldComponent(labelText: 'Senha', masked: true),
              AppTextFieldComponent(labelText: 'Confirmar Senha', masked: true),
              SizedBox(height: 30),
              AppFormButtonComponent(labelText: 'Seguir', onTap: () => navigateTo('/donator/signup/docs')),
            ],
          ),
        ),
      ),
    );
  }
}
