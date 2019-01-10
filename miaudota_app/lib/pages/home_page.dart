import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/models/anuncios.dart';
import 'package:miaudota_app/pages/anuncioAnimal_page.dart';
import 'package:miaudota_app/pages/listaAnuncios_page.dart';
import 'package:miaudota_app/pages/cadastro_animal.dart';
import 'package:miaudota_app/pages/profile_page.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:miaudota_app/repositories/usuario.dart';

class HomePage extends StatefulWidget {
  var anuncios = new List<Anuncio>();

  HomePage() {
    // anuncios = [];
    // anuncios.add(
    // Anuncios(title: "Cachorro filhote", sexo: "Macho", favorito: false));
    // anuncios
    // .add(Anuncios(title: "Gato filhote", sexo: "Macho", favorito: false));
    // anuncios.add(
    // Anuncios(title: "Cachorro adulto", sexo: "Macho", favorito: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ListaPage(),
    CadastroAnimalPage(),
    AnimalPage(),
    //ProfilePage(),
  ];
  AnuncioBloc bloc = AnuncioBloc();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AnuncioBloc>(context);
    bloc.add(AnuncioLoad());
  }

  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is AnuncioLoadingState || state is AnuncioNotInitState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Home Page',
                style: TextStyle(
                  color: AppStyle.colorWhite,
                ),
              ),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is AnuncioLoadedState) {
          final anuncios = state.anuncios;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Home Page',
                style: TextStyle(
                  color: AppStyle.colorWhite,
                ),
              ),
              actions: <Widget>[],
            ),
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Principal'),
                  backgroundColor: AppStyle.colorCyan,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Perfil'),
                  backgroundColor: AppStyle.colorCyan,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle),
                  title: Text('Animal'),
                  backgroundColor: AppStyle.colorCyan,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle),
                  title: Text('Item'),
                  backgroundColor: AppStyle.colorCyan,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.help),
                  title: Text('Ajuda'),
                  backgroundColor: AppStyle.colorCyan,
                ),
              ],
              selectedItemColor: Colors.black,
              showUnselectedLabels: true,
            ),
          );
        }
      },
    );
  }
}
