import 'package:dener/components/profile_button/profile_button_component.dart';
import 'package:dener/util/assets.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
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
              child: Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arima Madurai',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Contamos com você para construir uma\nrede de apoio e solidariedade.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Arima Madurai',
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [                
                ProfileButtonComponent(
                  title: 'Sou Doador',
                  assetImage: Assets.avatarDonator,
                  onTap: () {
                    print('Doador');
                  },
                ),
                ProfileButtonComponent(
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
