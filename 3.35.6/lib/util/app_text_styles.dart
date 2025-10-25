import 'package:flutter/material.dart';

class AppTextStyles extends InheritedWidget {

  AppTextStyles({required super.child, super.key});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {    
    return false;
  }

  static AppTextStyles? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTextStyles>()!;
  }

  static AppTextStyles of(BuildContext context) {
    final AppTextStyles? result = maybeOf(context);
    assert(result != null, 'No AppTextStyles found in context');
    return result!;
  }
  
  final TextStyle titleBlack = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Arima Madurai',
  );

  final TextStyle titleGrey = TextStyle(
    fontSize: 24,
    fontFamily: 'Arima Madurai',
    color: Colors.grey[700],
  );  

  final TextStyle regularBlack = TextStyle(
    fontSize: 18,
    fontFamily: 'Arima Madurai',
  );  

  final TextStyle regularGrey = TextStyle(
    fontSize: 18,
    fontFamily: 'Arima Madurai',
    color: Colors.grey[700],
  );

  final TextStyle buttonBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Arima Madurai',    
    color: Colors.black,
  );
}
