import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => onInit());
  }

  onInit() {}

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  /// Navigate to a new screen
  Future<void> navigateTo(String route, {Object? args}) {
    if (mounted) {
      return Navigator.of(context).pushNamed(route, arguments: args);
    }

    return Future.value();
  }

  /// Navigate back unless there's only one widget in the stack
  Future<void> navigateBack() {
    if (mounted) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }

    return Future.value();
  }

  /// Navigate to a new screen and remove all other previously pushed routes
  /// (empties the stack)
  Future<void> navigateToAndReset(String route, {Object? args}) {
    if (mounted) {
      return Navigator.of(context)
          .pushNamedAndRemoveUntil(route, (_) => false, arguments: args);
    }

    return Future.value();
  }

  /// Navigate to a new screen and remove the current route from the stack
  Future<void> navigateToAndReplace(String route, {Object? args}) {
    if (mounted) {
      return Navigator.of(context).pushReplacementNamed(route, arguments: args);
    }

    return Future.value();
  }

  /// Remove all messages from the screen (snackbars)
  void clearSnackbars() {
    if (mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }
  }

  /// Show a message on the screen (snackbar)
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
