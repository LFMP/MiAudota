import 'dart:async';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:miaudota_app/main.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Item',
          style: TextStyle(
            color: AppStyle.colorWhite,
          ),
        ),
      ),
      body: formulario(),
    );
  }
}

class formulario extends StatefulWidget {
  @override
  _formularioState createState() => _formularioState();
}

class _formularioState extends State<formulario> {
  final _formChave =
      GlobalKey<FormState>(); //identifica o formulario e nos permite validar
  var value = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formChave,
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "Título do anúncio",
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
