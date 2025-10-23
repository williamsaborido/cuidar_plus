import 'package:dener/util/navigator_key.dart';
import 'package:dener/views/welcome/welcome_view.dart';
import 'package:dener/views/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{

  final navigatorKey = GlobalKey<NavigatorState>();

  App({super.key}){
    NavigatorKey.instance.setKey = navigatorKey;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),      
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
      },
      navigatorKey: navigatorKey,
    );    
  }
}