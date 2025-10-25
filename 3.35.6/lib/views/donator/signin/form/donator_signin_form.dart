import 'package:dener/components/app_form_button/app_form_button.component.dart';
import 'package:dener/components/app_header/app_header_component.dart';
import 'package:dener/components/app_text_field/app_text_field_component.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';

class DonatorSigninForm extends StatefulWidget {
  const DonatorSigninForm({super.key});

  @override
  State<DonatorSigninForm> createState() => _DonatorSigninFormState();
}

class _DonatorSigninFormState extends BaseState<DonatorSigninForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              AppHeaderComponent(action: navigateBack, close: true),
              AppTextFieldComponent(labelText: 'Nome completo'),
              AppTextFieldComponent(labelText: 'E-mail'),
              AppTextFieldComponent(labelText: 'Confirmar e-mail'),
              AppTextFieldComponent(labelText: 'CPF'),
              AppTextFieldComponent(labelText: 'Senha', masked: true),
              AppTextFieldComponent(labelText: 'Confirmar Senha', masked: true),
              SizedBox(height: 30),
              AppFormButtonComponent(labelText: 'Seguir', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
