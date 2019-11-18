import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 180,
          height: 180,
          child: Image.asset('assets/logoMiaudotaEscrito.png'),
        ),
      ),
    );
  }
}
