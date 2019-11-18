import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miaudota_app/pages/cadastro_page.dart';
import 'package:miaudota_app/utils/slider.dart';
import 'package:miaudota_app/utils/style.dart';

class LoginPage extends StatelessWidget {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppStyle.padding,
        color: AppStyle.colorCyan,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 180,
              height: 180,
              child: Image.asset('assets/logoMiaudotaEscrito.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _userController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail ou username',
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
              obscureText: true,
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
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppStyle.colorCyanEightHundred,
                      ),
                    ),
                  ),
                  onPressed: () => print('login'),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
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
                      'Cadastrar-se',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppStyle.colorCyanEightHundred,
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    SlideRoute(
                      page: CadastroPage(),
                      direction: SlideDirection.RIGHT_LEFT,
                    ),
                    (_) => true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
