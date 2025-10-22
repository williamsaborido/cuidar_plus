import 'dart:async';

import 'package:flutter/widgets.dart';

class SplashViewController extends ChangeNotifier {
  Timer? _debounce;

  int count = 0;
  String? username;

  void up() {
    count++;
    notifyListeners();
  }

  void down() {
    count--;
    notifyListeners();
  }

  void setUsername(String value) {
    username = value;

    _debounce = Timer(const Duration(milliseconds: 1000), () {
      notifyListeners();
      _debounce?.cancel();
    });    
  }
}
