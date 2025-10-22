import 'package:dener/util/assets.dart';
import 'package:dener/util/base_state.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(        
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.loginBackground),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Column(            
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,            
            children: [
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.55,                
                child: Image.asset(Assets.companyLogo),
              ),
              Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arima Madurai',
                ),
              ),
              Text('Contamos com você para construir uma\nrede de apoio e solidariedade.', 
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Arima Madurai',
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
