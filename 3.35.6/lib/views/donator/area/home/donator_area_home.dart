import 'package:dener/components/app_home_button/app_home_button_component.dart';
import 'package:dener/components/app_home_drawer/app_donator_home_drawer_component.dart';
import 'package:dener/util/app_text_styles.dart';
import 'package:dener/util/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonatorAreaHome extends StatelessWidget {
  const DonatorAreaHome({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTextStyles textStyles = AppTextStyles.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.notifications_outlined, color: Color(0xFFF6B3CF)),
          const SizedBox(width: 10),
          const CircleAvatar(child: Text('US')),
          const SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        child: AppDonatorHomeDrawerComponent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.smart_toy),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 60),
              child: Text('Olá, Usuário', style: textStyles.titleBlack),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
              child: AppHomeButtonComponent(
                labelText: 'Pontos de Recolhimento',
                iconData: Icons.pin_drop,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
              child: AppHomeButtonComponent(
                labelText: 'Doação direta',
                iconData: Icons.handshake,
                onPressed: () {},
              ),
            ),
            Expanded(child: Center(child: Image.asset(Assets.companyLogo))),
            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(FontAwesomeIcons.youtube),
                FaIcon(FontAwesomeIcons.facebook),
                FaIcon(FontAwesomeIcons.xTwitter),
                FaIcon(FontAwesomeIcons.instagram),
              ],
            ),
            Text('Nos siga nas redes', style: textStyles.regularBlack),
          ],
        ),
      ),
    );
  }
}
