import 'package:dener/components/app_capture_button/app_capture_button.dart';
import 'package:dener/components/app_form_button/app_form_button.component.dart';
import 'package:dener/components/app_header/app_header_component.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';

/// Formulário de submissão dos documentos do doador
class DonatorSignupDocs extends StatefulWidget {
  /// Cria o formulário de submissão dos documentos do doador
  const DonatorSignupDocs({ super.key });

  @override
  State<DonatorSignupDocs> createState() => _DonatorSignupDocsState();
}

class _DonatorSignupDocsState extends BaseState<DonatorSignupDocs> {

  /// Abre a tela de captura de foto, retornando true se o usuário confirmou a imagem capturada
  Future<bool> getPicture() async {
    final result = await navigateToAndReturn('/donator/signup/capture');
    return (result as bool?) ?? false;
  }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 40,
            children: [
              AppHeaderComponent(action: navigateBack, labelText: 'Envio de Documentos', close: false),
              AppCaptureButton(textLabel: 'Foto RG - Frente', icon: Icons.account_circle, onTap: getPicture),
              AppCaptureButton(textLabel: 'Foto RG - Verso', icon: Icons.account_circle, onTap: getPicture),
              AppCaptureButton(textLabel: 'Registrar facial', icon: Icons.photo_camera, onTap: getPicture),
              AppCaptureButton(textLabel: 'Comprovante de residência', icon: Icons.home, onTap: getPicture),
              SizedBox(height: 30),
              AppFormButtonComponent(labelText: 'Cadastrar', onTap: () {
                super.navigateToAndReset('/donator/area/home');
                }),
            ],
          ),
        ),
      ),
    );
  }
}