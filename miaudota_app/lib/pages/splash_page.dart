import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppStyle.colorCyan,
        child: Center(
          child: SizedBox(
            width: 180,
            height: 180,
            child: Image.asset('assets/logoMiaudotaEscrito.png'),
          ),
        ),
      ),
    );
  }
}
