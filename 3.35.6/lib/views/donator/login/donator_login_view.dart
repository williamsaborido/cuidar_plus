import 'package:dener/components/button/button_component.dart';
import 'package:dener/components/checkbox/checkbox_component.dart';
import 'package:dener/components/masked_text_field/masked_text_field_component.dart';
import 'package:dener/components/text_field/text_field_component.dart';
import 'package:dener/util/assets.dart';
import 'package:dener/util/base_state.dart';
import 'package:dener/util/fonts.dart';
import 'package:flutter/material.dart';

class DonatorLoginView extends StatefulWidget {
  const DonatorLoginView({super.key});

  @override
  State<DonatorLoginView> createState() => _DonatorLoginViewState();
}

class _DonatorLoginViewState extends BaseState<DonatorLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.55,
              padding: const EdgeInsets.only(left: 30, top: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.loginBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(Assets.avatarDonator),
                  ),
                  Text('Olá, doador,', style: Fonts.titleBlack),
                  Text(
                    'Sua generosidade constrói pontes de esperança. Junte-se a nós para fazer a diferença na vida de quem precisa.',
                    style: Fonts.regularBlack,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextFieldComponent(labelText: 'E-mail'),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaskedTextFieldComponent(labelText: 'Senha'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CheckboxComponent(text: 'Lembrar senha'),
            ),
            SizedBox(height: 10),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonComponent(text: 'Login', onPressed: () {},),
                ButtonComponent(text: 'Cadastro', onPressed: (){},),
              ],
            ),
            SizedBox(height: 40),
            IconButton(onPressed: navigateBack, icon: Image.asset(Assets.backArrow),),
          ],
        ),
      ),
    );
  }
}
