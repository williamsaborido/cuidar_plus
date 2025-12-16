import 'package:flutter/material.dart';

/// Classe de estilos de texto utilizados no aplicativo
class AppTextStyles extends InheritedWidget {

  /// Cria a classe de estilos de texto utilizados no aplicativo
  AppTextStyles({required super.child, super.key});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {    
    return false;
  }

  /// Retorna a instância de AppTextStyles a partir do contexto, ou null se não existir
  static AppTextStyles? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTextStyles>()!;
  }

  /// Retorna a instância de AppTextStyles a partir do contexto
  static AppTextStyles of(BuildContext context) {
    final AppTextStyles? result = maybeOf(context);
    assert(result != null, 'No AppTextStyles found in context');
    return result!;
  }
  
  /// Estilo de texto para títulos em negrito
  final TextStyle titleBlack = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Arima Madurai',
  );

  /// Estilo de texto para títulos em cinza
  final TextStyle titleGrey = TextStyle(
    fontSize: 24,
    fontFamily: 'Arima Madurai',
    color: Colors.grey[700],
  );  

  /// Estilo de texto para textos regulares em preto
  final TextStyle regularBlack = TextStyle(
    fontSize: 18,
    fontFamily: 'Arima Madurai',
    fontWeight: FontWeight.bold
  );  

  /// Estilo de texto para textos regulares em cinza
  final TextStyle regularGrey = TextStyle(
    fontSize: 18,
    fontFamily: 'Arima Madurai',
    color: Colors.grey[700],
  );

  /// Estilo de texto para botões em preto
  final TextStyle buttonBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Arima Madurai',    
    color: Colors.black,
  );
}
