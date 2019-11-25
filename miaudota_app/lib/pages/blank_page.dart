import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'página em branco',
          style: TextStyle(
            color: AppStyle.colorWhite,
          ),
        ),
      ),
    );
  }
}
