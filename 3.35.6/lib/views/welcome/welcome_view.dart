import 'package:dener/components/app_profile_button/app_profile_button_component.dart';
import 'package:dener/util/assets.dart';
import 'package:dener/util/base_state.dart';
import 'package:dener/util/app_text_styles.dart';
import 'package:flutter/material.dart';

/// tela de boas-vindas da aplicação (seleção entre doador e receptor)
class WelcomeView extends StatefulWidget {
  /// Cria a tela de boas-vindas da aplicação (seleção entre doador e receptor)
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends BaseState<WelcomeView> {

  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = AppTextStyles.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.loginBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Align(
                  alignment: AlignmentGeometry.topCenter,
                  child: Image.asset(Assets.companyLogo),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Bem-vindo',style: textStyles.titleBlack),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Contamos com você para construir uma\nrede de apoio e solidariedade.',
                style: textStyles.regularGrey,
              ),
            ),
            SizedBox(height: 40),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [                
                AppProfileButtonComponent(
                  title: 'Sou Doador',
                  assetImage: Assets.avatarDonator,
                  onTap: () {
                    navigateTo('/donator/login');
                  },
                ),
                AppProfileButtonComponent(
                  title: 'Sou Receptor',
                  assetImage: Assets.avatarRecipient,
                  onTap: () {
                    print('Receptor');
                  },
                ),
              ],
            ),            
          ],
        ),
      ),
    );
  }
}
