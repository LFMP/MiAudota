import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/pages/cadastro_animal.dart';
import 'package:miaudota_app/pages/home_page.dart';
import 'package:miaudota_app/utils/style.dart';

void main() => runApp(BlocProvider<AnuncioBloc>(
    builder: (context) => AnuncioBloc(), child: MiAudota()));

class MiAudota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiAudota',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppStyle.colorCyan,
      ),
      home: HomePage(),
      // CadastroAnimalPage(),
    );
  }
}
