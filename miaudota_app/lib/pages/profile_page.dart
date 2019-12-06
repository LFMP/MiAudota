import 'package:flutter/material.dart';
import 'package:miaudota_app/utils/style.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _status = false;

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
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/as.png'),
                minRadius: 90,
                maxRadius: 150,
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
                        onTap: () => setState(() {
                          _status = !_status;
                        }),
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
                        onTap: () => _inputTelefone(context),
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
                        onTap: () => setState(() {
                          _status = !_status;
                        }),
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
