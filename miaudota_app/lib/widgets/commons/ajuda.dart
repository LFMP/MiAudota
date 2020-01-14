import 'package:flutter/material.dart';

Future<void> showHelp(BuildContext context,
    {@required String campo, @required String texto}) async {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('O campo ' + campo + ':'),
        content: Text(texto),
        actions: <Widget>[
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
