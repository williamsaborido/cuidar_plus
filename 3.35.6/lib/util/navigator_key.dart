import 'package:flutter/material.dart';
/// Singleton para gerenciar a navegação globalmente
class NavigatorKey {
  static NavigatorKey? _instance;

  late final GlobalKey<NavigatorState> _navigatorKey;

  NavigatorKey._();

  /// Retorna a instância singleton de NavigatorKey para gerenciar a navegação globalmente
  static NavigatorKey get instance {
    _instance ??= NavigatorKey._();
    return _instance!;
  }

  /// Define a chave do Navigator para navegação global
  set setKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  /// Retorna para a tela inicial removendo todas as outras telas da pilha de navegação,
  /// usado principalmente no logoff do usuário (login expirado, por exemplo)
  Future<void> logoff() async {
    _navigatorKey.currentState?.pushNamedAndRemoveUntil('/welcome', (_) => false);
  }
}