import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Edite seu perfil',
            style: TextStyle(
              color: AppStyle.colorWhite,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppStyle.colorCyan,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, true),
          )),
      body: Container(
        color: AppStyle.colorWhite,
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 180,
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/as.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: Container(
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Informações pessoais',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    CircleAvatar(
                      backgroundColor: AppStyle.colorCyan,
                      child: GestureDetector(
                        child: Icon(
                          Icons.edit,
                          color: AppStyle.colorWhite,
                        ),
                        onTap: () => status = !status,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              enabled: status,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nome completo',
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: AppStyle.colorBlack,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              enabled: status,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: AppStyle.colorBlack,
              ),
            ),
            TextFormField(
              enabled: status,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: AppStyle.colorBlack,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: Container(
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Telefones',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                    CircleAvatar(
                      backgroundColor: AppStyle.colorCyan,
                      child: GestureDetector(
                        child: Icon(
                          Icons.add,
                          color: AppStyle.colorWhite,
                        ),
                        onTap: () => status = !status,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: Container(
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Endereços',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 195,
                    ),
                    CircleAvatar(
                      backgroundColor: AppStyle.colorCyan,
                      child: GestureDetector(
                        child: Icon(
                          Icons.add,
                          color: AppStyle.colorWhite,
                        ),
                        onTap: () => status = !status,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
