import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _status = false;
  File _image;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future<void> _inputTelefone(BuildContext context) async {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar novo telefone'),
          content: Row(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 80,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'DDD',
                    hintText: 'ex. 44',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 80,
                width: 170,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    hintText: 'ex. 999876543',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('Confirmar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _inputEndereco(BuildContext context) async {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar novo endereço'),
          content: Container(
            height: 280,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Número',
                          hintText: 'ex. 666',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'CEP',
                          hintText: 'ex. 87000000',
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Complemento',
                    hintText: 'ex. APTO 003',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Rua',
                    hintText: 'ex. Rua dos perdidos',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      height: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Cidade',
                          hintText: 'ex. Padre Donizete',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Estado',
                          hintText: 'ex. PR',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('Confirmar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu perfil',
          style: TextStyle(
            color: AppStyle.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppStyle.colorCyan,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
      body: Container(
        color: AppStyle.colorWhite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 200,
              alignment: const Alignment(0.0, 1.15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(180)),
                image: DecorationImage(
                  image:
                      _image ?? const AssetImage('assets/profile-picture.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(56),
                  ),
                ),
                child: SizedBox.expand(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppStyle.colorCyan,
                      borderRadius: BorderRadius.all(Radius.circular(180)),
                    ),
                    child: FlatButton(
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () => getImage(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      'Informações pessoais',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: AppStyle.colorCyan,
                        child: GestureDetector(
                          child: const Icon(
                            Icons.edit,
                            color: AppStyle.colorWhite,
                          ),
                          onTap: () => setState(() {
                            _status = !_status;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    enabled: _status,
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
                    enabled: _status,
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
                    enabled: _status,
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
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      'Telefones',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: AppStyle.colorCyan,
                        child: GestureDetector(
                          child: const Icon(
                            Icons.add,
                            color: AppStyle.colorWhite,
                          ),
                          onTap: () => _inputTelefone(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      'Endereços',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: AppStyle.colorCyan,
                        child: GestureDetector(
                          child: const Icon(
                            Icons.add,
                            color: AppStyle.colorWhite,
                          ),
                          onTap: () => _inputEndereco(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
