import 'package:dener/util/app_text_styles.dart';
import 'package:dener/util/navigator_key.dart';
import 'package:dener/views/donator/login/donator_login_view.dart';
import 'package:dener/views/donator/signup/docs/donator_signup_docs.dart';
import 'package:dener/views/donator/signup/form/donator_signup_form.dart';
import 'package:dener/views/welcome/welcome_view.dart';
import 'package:dener/views/splash/splash_view.dart';
import 'package:flutter/material.dart';

/// A função main é o "ponto de entrada" da aplicação Flutter
void main() {
  runApp(App());
}

/// Classe App, widget inicial da aplicação Flutter, instanciada na função main (runApp)
class App extends StatelessWidget{

  final navigatorKey = GlobalKey<NavigatorState>();
  /// Cria a classe App, widget inicial da aplicação Flutter, instanciada na função main (runApp)
  App({super.key}){
    NavigatorKey.instance.setKey = navigatorKey;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextStyles(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ), 
        // Rota inicial da aplicação     
        initialRoute: '/',
        // Registro das rotas da aplicação (nome => widget da tela)
        routes: {
          '/': (context) => const SplashView(),
          '/welcome': (context) => const WelcomeView(),
          '/donator/login': (context) => const DonatorLoginView(),
          '/donator/signup/form': (context) => const DonatorSignupForm(),
          '/donator/signup/docs': (context) => const DonatorSignupDocs(),
        },
        // Chave do Navigator para navegação global
        navigatorKey: navigatorKey,
      ),
    );    
  }
}