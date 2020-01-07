import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';

class AnuncioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Informações básicas',
            style: TextStyle(
              color: AppStyle.colorWhite,
            ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Pessoa Física',
                icon: Icon(
                  Icons.person,
                  color: AppStyle.colorWhite,
                ),
              ),
              Tab(
                text: 'Pessoa Jurídica',
                icon: Icon(
                  Icons.people,
                  color: AppStyle.colorWhite,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
