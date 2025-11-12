import 'package:dener/util/assets.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';

/// Tela de splash da aplicação (inicialização de dados e serviços)
class SplashView extends StatefulWidget {
  /// Cria a tela de splash da aplicação (inicialização de dados e serviços)
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {

@override
  onInit() {   
    Future.delayed(Duration(seconds: 3), () {
      navigateToAndReset('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Flex(direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,              
          children: [                
            Center(
              child: Image.asset(Assets.splashLogo),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 20,
                maxHeight: 20,
              ),
              child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
