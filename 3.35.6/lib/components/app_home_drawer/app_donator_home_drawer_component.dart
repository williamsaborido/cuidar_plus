import 'package:dener/util/app_text_styles.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';

class AppDonatorHomeDrawerComponent extends StatefulWidget {
  const AppDonatorHomeDrawerComponent({super.key});

  @override
  State<AppDonatorHomeDrawerComponent> createState() => _AppDonatorHomeDrawerComponentState();
}

class _AppDonatorHomeDrawerComponentState extends BaseState<AppDonatorHomeDrawerComponent> {
  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          SizedBox(height: 30),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, size: 50),
              Text('Início', style: textStyle.titleBlack),
            ],
          ),
          SizedBox(height: 60),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Cadastro de Remédios',
                    style: textStyle.regularBlack,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Cadastro de Suprimentos',
                    style: textStyle.regularBlack,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Solicitações', style: textStyle.regularBlack),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Minha Conta', style: textStyle.regularBlack),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () async {
                  if (await confirm('Deseja mesmo sair?')){
                    navigateToAndReset('/');
                  }
                },
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.logout),
                    Text('Sair', style: textStyle.regularBlack),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 30,)),
            ],
          ),
        ],
      ),
    );
  }
}
