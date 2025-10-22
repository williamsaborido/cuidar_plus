import 'package:flutter/material.dart';

class NavigatorKey {
  static NavigatorKey? _instance;

  late final GlobalKey<NavigatorState> _navigatorKey;

  NavigatorKey._();

  static NavigatorKey get instance {
    _instance ??= NavigatorKey._();
    return _instance!;
  }

  set setKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  Future<void> logoff() async {
    _navigatorKey.currentState?.pushNamedAndRemoveUntil('login', (_) => false);
  }
}