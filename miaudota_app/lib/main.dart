import 'package:flutter/material.dart';
import 'package:miaudota_app/pages/login_page.dart';
import 'package:miaudota_app/utils/style.dart';

void main() => runApp(MiAudota());

class MiAudota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiAudota',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppStyle.colorCyan,
      ),
      home: LoginPage(),
    );
  }
}
