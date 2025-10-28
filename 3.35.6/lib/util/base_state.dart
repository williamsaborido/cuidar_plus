import 'package:flutter/material.dart';

/// Classe base para uso do contexo para navegação, snackbar e tamanho de tela
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onInit());
  }

  /// Método chamado após a inicialização do widget (postFrameCallback)
  onInit() {}

  /// Obtém largura da tela
  double get screenWidth => MediaQuery.of(context).size.width;

  /// Obtém altura da tela
  double get screenHeight => MediaQuery.of(context).size.height;

  /// Navega para uma nova tela (adiciona widget da rota no topo da pilha de navegação)
  Future<void> navigateTo(String route, {Object? args}) {
    if (mounted) {
      return Navigator.of(context).pushNamed(route, arguments: args);
    }

    return Future.value();
  }

  /// "Navega de volta", removendo a rota, ou widget atual, da pilha de navegação, 
  /// mas não faz a navegação se este widget for o único na pilha
  Future<void> navigateBack() {
    if (mounted) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }

    return Future.value();
  }

  /// Navega para uma nova rota removendo todas as outras telas da pilha de navegação
  /// (esvazia a pilha de navegação e navega para a nova rota)
  Future<void> navigateToAndReset(String route, {Object? args}) {
    if (mounted) {
      return Navigator.of(context)
          .pushNamedAndRemoveUntil(route, (_) => false, arguments: args);
    }

    return Future.value();
  }

  /// Navega para uma nova tela e remove a rota atual da pilha de navegação
  /// (substitui o widget atual pelo novo widget da rota)
  Future<void> navigateToAndReplace(String route, {Object? args}) {
    if (mounted) {
      return Navigator.of(context).pushReplacementNamed(route, arguments: args);
    }

    return Future.value();
  }

  /// Remove todas as snackbars atualmente exibidas
  void clearSnackbars() {
    if (mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }
  }

  /// Exibe uma snackbar com a mensagem fornecida pelo parâmetro [message]
  void showSnackbar(String message) {
    if (mounted) {
      clearSnackbars();

      final snackbar = SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          onPressed: clearSnackbars,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
