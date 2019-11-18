import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miaudota_app/utils/style.dart';

class CadastroPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _cpfController = TextEditingController();
  // final _cnpjController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppStyle.padding,
        color: AppStyle.colorCyan,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: AppStyle.colorWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: AppStyle.colorWhite,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nome completo',
                labelStyle: TextStyle(
                  color: AppStyle.colorWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: AppStyle.colorWhite,
              ),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: AppStyle.colorWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: AppStyle.colorWhite,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: AppStyle.colorWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: AppStyle.colorWhite,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppStyle.colorWhite,
                borderRadius: const BorderRadius.all(Radius.circular(60)),
              ),
              child: SizedBox(
                child: FlatButton(
                  child: Container(
                    child: Text(
                      'Próximo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppStyle.colorCyanEightHundred,
                      ),
                    ),
                  ),
                  onPressed: () => print('próximo'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
