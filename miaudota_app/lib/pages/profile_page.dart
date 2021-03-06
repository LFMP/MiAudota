import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:miaudota_app/blocs/authentication.dart';
import 'package:miaudota_app/blocs/events/authentication.dart';
import 'package:miaudota_app/blocs/events/usuario.dart';
import 'package:miaudota_app/blocs/states/usuario.dart';
import 'package:miaudota_app/blocs/usuario.dart';
import 'package:miaudota_app/models/contatos.dart';
import 'package:miaudota_app/models/endereco.dart';
import 'package:miaudota_app/models/usuario.dart';
import 'package:miaudota_app/repositories/usuario.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  final UsuarioRepository userRepository;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _status = false;
  String _image;
  final dddControler = MaskedTextController(mask: '00');
  final telefoneControler = MaskedTextController(mask: '000000000');
  final numeroControler = TextEditingController();
  final cepControler = MaskedTextController(mask: '00000-000');
  final cidadeControler = TextEditingController();
  final estadoControler = TextEditingController();
  final ruaControler = TextEditingController();
  final complementoControler = TextEditingController();
  final nomeControler = TextEditingController();
  final emailControler = TextEditingController();
  final senhaControler = TextEditingController();
  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    final UserProfile _usuarioBloc = BlocProvider.of<UserProfile>(context);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Future<void> _onUpdateButtonPressed() async {
      final String email = await storage.read(key: 'email');
      final String foto = await storage.read(key: 'imagem');
      final String nome = await storage.read(key: 'nome');
      final String password = await storage.read(key: 'password');
      final String realm = await storage.read(key: 'realm');
      final String username = await storage.read(key: 'username');
      _usuarioBloc.add(
        UpdateUserbuttonPressed(
            email: email,
            foto: foto,
            nome: nome,
            password: password,
            realm: realm,
            username: username),
      );
    }

    Future<void> setUserImage() async {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      final String encoded = base64Encode(image.readAsBytesSync());
      setState(() {
        _image = encoded;
      });

      storage.write(key: 'imagem', value: encoded);
    }

    Future<void> _inputTelefone(
        BuildContext context, UserProfile _usuarioBloc) async {
      final GlobalKey<FormState> _dddKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _telefoneKey = GlobalKey<FormState>();
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Adicionar novo telefone'),
            content: Row(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: dddControler,
                    key: _dddKey,
                    decoration: const InputDecoration(
                      labelText: 'DDD',
                      hintText: 'ex. 44',
                    ),
                    autovalidate: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Obrigatorio';
                      }
                      if (value.length > 2 || value.length < 2) {
                        return 'Invalido';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 80,
                  width: 120,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: telefoneControler,
                    key: _telefoneKey,
                    autovalidate: true,
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      hintText: 'ex. 999876643',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo obrigatorio';
                      }
                      if (value.length > 9 || value.length < 8) {
                        return 'Telefone invalido';
                      }
                      return null;
                    },
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
                  _usuarioBloc.add(
                    InsertContatoButtonPressed(
                        ddd: dddControler.text,
                        telefone: telefoneControler.text),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _editTelefone(
      BuildContext context,
      UserProfile _usuarioBloc,
      String ddd,
      String telefone,
      String id,
    ) async {
      final GlobalKey<FormState> _dddKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _telefoneKey = GlobalKey<FormState>();
      dddControler.text = ddd;
      telefoneControler.text = telefone;
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Editar telefone'),
            content: Row(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: dddControler,
                    key: _dddKey,
                    decoration: const InputDecoration(
                      labelText: 'DDD',
                      hintText: 'ex. 44',
                    ),
                    autovalidate: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Obrigatorio';
                      }
                      if (value.length > 2 || value.length < 2) {
                        return 'Invalido';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 80,
                  width: 120,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: telefoneControler,
                    key: _telefoneKey,
                    autovalidate: true,
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      hintText: 'ex. 999876643',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo obrigatorio';
                      }
                      if (value.length > 9 || value.length < 8) {
                        return 'Telefone invalido';
                      }
                      return null;
                    },
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
                  _usuarioBloc.add(
                    EditContatoButtonPressed(
                      ddd: dddControler.text,
                      telefone: telefoneControler.text,
                      id: id,
                    ),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _inputEndereco(
      BuildContext context,
      UserProfile _usuarioBloc,
    ) async {
      final GlobalKey<FormState> _numeroKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _complementoKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _ruaKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _cepKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _cidadeKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _estadoKey = GlobalKey<FormState>();
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Adicionar novo endereço'),
            content: Container(
              height: 302,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 70,
                        height: 72,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: numeroControler,
                          key: _numeroKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'Número',
                            hintText: 'ex. 666',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        height: 72,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: cepControler,
                          key: _cepKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'CEP',
                            hintText: 'ex. 87000-000',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Campo obrigatorio';
                            }
                            if (value.length > 9 || value.length < 9) {
                              return 'CEP invalido';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 74,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: complementoControler,
                      key: _complementoKey,
                      autovalidate: true,
                      decoration: const InputDecoration(
                        labelText: 'Complemento',
                        hintText: 'ex. APTO 003',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatorio';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 74,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: ruaControler,
                      key: _ruaKey,
                      autovalidate: true,
                      decoration: const InputDecoration(
                        labelText: 'Rua',
                        hintText: 'ex. Rua dos perdidos',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatorio';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        height: 65,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cidadeControler,
                          key: _cidadeKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'Cidade',
                            hintText: 'ex. Padre Donizete',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Campo obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 65,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: estadoControler,
                          key: _estadoKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'Estado',
                            hintText: 'ex. PR',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Obrigatorio';
                            }
                            if (value.length != 2) {
                              return 'Invalido';
                            }
                            return null;
                          },
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
                  _usuarioBloc.add(
                    InsertEnderecoButtonPressed(
                      cep: cepControler.text,
                      cidade: cidadeControler.text,
                      complemento: complementoControler.text,
                      estado: estadoControler.text,
                      numero: numeroControler.text,
                      rua: ruaControler.text,
                    ),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _editEndereco(
      BuildContext context,
      UserProfile _usuarioBloc,
      EnderecoModel endereco,
    ) async {
      final GlobalKey<FormState> _numeroKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _complementoKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _ruaKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _cepKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _cidadeKey = GlobalKey<FormState>();
      final GlobalKey<FormState> _estadoKey = GlobalKey<FormState>();
      numeroControler.text = endereco.numero;
      complementoControler.text = endereco.complemento;
      ruaControler.text = endereco.rua;
      cepControler.text = endereco.cep;
      cidadeControler.text = endereco.cidade;
      estadoControler.text = endereco.estado;
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Editar endereço'),
            content: Container(
              height: 302,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 70,
                        height: 72,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: numeroControler,
                          key: _numeroKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'Número',
                            hintText: 'ex. 666',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        height: 72,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: cepControler,
                          key: _cepKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'CEP',
                            hintText: 'ex. 87000-000',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Campo obrigatorio';
                            }
                            if (value.length > 9 || value.length < 9) {
                              return 'CEP invalido';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 74,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: complementoControler,
                      key: _complementoKey,
                      autovalidate: true,
                      decoration: const InputDecoration(
                        labelText: 'Complemento',
                        hintText: 'ex. APTO 003',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatorio';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 74,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: ruaControler,
                      key: _ruaKey,
                      autovalidate: true,
                      decoration: const InputDecoration(
                        labelText: 'Rua',
                        hintText: 'ex. Rua dos perdidos',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatorio';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        height: 65,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cidadeControler,
                          key: _cidadeKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'Cidade',
                            hintText: 'ex. Padre Donizete',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Campo obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 65,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: estadoControler,
                          key: _estadoKey,
                          autovalidate: true,
                          decoration: const InputDecoration(
                            labelText: 'Estado',
                            hintText: 'ex. PR',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Obrigatorio';
                            }
                            if (value.length != 2) {
                              return 'Invalido';
                            }
                            return null;
                          },
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
                  _usuarioBloc.add(
                    EditEnderecoButtonPressed(
                      id: endereco.id,
                      cep: cepControler.text,
                      cidade: cidadeControler.text,
                      complemento: complementoControler.text,
                      estado: estadoControler.text,
                      numero: numeroControler.text,
                      rua: ruaControler.text,
                    ),
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return BlocListener<UserProfile, UserProfileState>(
      listener: (context, state) {
        if (state is UserProfileFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder(
        bloc: _usuarioBloc,
        builder: (context, state) {
          List<ContatosModel> _contatos =
              state != UserProfileLoaded || state != UserProfileModified
                  ? []
                  : state.contatos;

          List<EnderecoModel> _enderecos =
              state != UserProfileLoaded || state != UserProfileModified
                  ? []
                  : state.enderecos;

          if (state is UserProfileInitial) {
            _usuarioBloc.add(const LoadUserInformations());
          }
          if (state is UserProfileLoaded) {
            final UsuarioModel usuario = state.usuario;
            _contatos = state.contatos;
            _enderecos = state.enderecos;
            _image = usuario.foto;
            nomeControler.text = usuario.nome;
            emailControler.text = usuario.email;
            senhaControler.text = usuario.password;
          }

          if (state is UserProfileDeleted) {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          }

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
                    child: Container(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: _image == null
                            ? const AssetImage('assets/profile-picture.png')
                            : MemoryImage(base64Decode(_image)),
                        child: IconButton(
                          padding: const EdgeInsets.only(top: 140),
                          iconSize: 40,
                          color: AppStyle.colorWhite,
                          icon: const Icon(Icons.add_box),
                          onPressed: () => setUserImage(),
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
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          enabled: _status,
                          keyboardType: TextInputType.text,
                          controller: nomeControler,
                          autovalidate: true,
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'O campo não pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          enabled: _status,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailControler,
                          autovalidate: true,
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'O campo não pode ser vazio';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          enabled: _status,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          controller: senhaControler,
                          autovalidate: true,
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'O campo não pode ser vazio';
                            }
                            return null;
                          },
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
                                onTap: () =>
                                    _inputTelefone(context, _usuarioBloc),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _contatos.length,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: ListTile(
                        onTap: () => _editTelefone(
                          context,
                          _usuarioBloc,
                          _contatos[index].ddd,
                          _contatos[index].telefone,
                          _contatos[index].id,
                        ),
                        trailing: IconButton(
                          color: Colors.red,
                          onPressed: () => _usuarioBloc.add(
                            DeleteContatoButtonPressed(id: _contatos[index].id),
                          ),
                          icon: Icon(Icons.delete_forever),
                          iconSize: 40,
                        ),
                        title: Text('( ' +
                            _contatos[index].ddd +
                            ' ) ' +
                            _contatos[index].telefone),
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
                                onTap: () =>
                                    _inputEndereco(context, _usuarioBloc),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: _enderecos.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: ListTile(
                        onTap: () => _editEndereco(
                          context,
                          _usuarioBloc,
                          EnderecoModel(
                            cep: _enderecos[index].cep,
                            rua: _enderecos[index].rua,
                            cidade: _enderecos[index].cidade,
                            estado: _enderecos[index].estado,
                            numero: _enderecos[index].numero.toString(),
                            complemento: _enderecos[index].complemento,
                            id: _enderecos[index].id,
                            usuarioId: _enderecos[index].usuarioId,
                          ),
                        ),
                        trailing: IconButton(
                          color: Colors.red,
                          onPressed: () => _usuarioBloc.add(
                            DeleteEnderecoButtonPressed(
                                id: _enderecos[index].id),
                          ),
                          icon: Icon(Icons.delete_forever),
                          iconSize: 40,
                        ),
                        title: Text(_enderecos[index].rua +
                            ', ' +
                            _enderecos[index].numero.toString()),
                        subtitle: Text(_enderecos[index].cep),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: FlatButton(
                      color: AppStyle.colorCyanEightHundred,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: AppStyle.colorCyanEightHundred),
                      ),
                      child: Container(
                        child: const Text(
                          'Atualizar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppStyle.colorWhite,
                          ),
                        ),
                      ),
                      onPressed: () => _formKey.currentState.validate()
                          ? _onUpdateButtonPressed()
                          : null,
                    ),
                  ),
                  SizedBox(
                    child: FlatButton(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.orange),
                      ),
                      child: Container(
                        child: const Text(
                          'Sair',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppStyle.colorWhite,
                          ),
                        ),
                      ),
                      onPressed: () => {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoggedOut())
                      },
                    ),
                  ),
                  SizedBox(
                    child: FlatButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red),
                      ),
                      child: Container(
                        child: const Text(
                          'Excluir perfil',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppStyle.colorWhite,
                          ),
                        ),
                      ),
                      onPressed: () => {
                        _usuarioBloc.add(
                          const DeleteUserButtonPressed(),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
