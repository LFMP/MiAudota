import 'package:flutter/material.dart';
import 'package:miaudota_app/blocs/authentication.dart';
import 'package:miaudota_app/blocs/events/authentication.dart';
import 'package:miaudota_app/blocs/states/authentication.dart';
import 'package:miaudota_app/pages/cadastro_item.dart';
import 'package:miaudota_app/pages/ajuda_page.dart';
import 'package:miaudota_app/pages/teste.dart';
import 'package:miaudota_app/pages/blank_page.dart';
import 'package:miaudota_app/blocs/usuario.dart';
import 'package:miaudota_app/pages/login_page.dart';
import 'package:miaudota_app/pages/profile_page.dart';
import 'package:miaudota_app/pages/splash_page.dart';
import 'package:miaudota_app/repositories/usuario.dart';
import 'package:miaudota_app/utils/loading.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaudota_app/blocs/anuncios.dart';
import 'package:miaudota_app/pages/cadastro_animal.dart';
import 'package:miaudota_app/pages/home_page.dart';
import 'package:miaudota_app/pages/anuncioAnimal_page.dart';
import 'package:miaudota_app/utils/style.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UsuarioRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        builder: (context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
      ),
      BlocProvider<AnuncioBloc>(
        builder: (context) {
          return AnuncioBloc();
        },
      ),
    ],
    child: MiAudota(userRepository: userRepository),
  ));
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

class MiAudota extends StatelessWidget {
  const MiAudota({Key key, this.userRepository}) : super(key: key);
  final UsuarioRepository userRepository;

  @override
  Widget build(BuildContext context) {
    final AnuncioBloc anuncioBloc = AnuncioBloc();
    return MaterialApp(
      title: 'MiAudota',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppStyle.colorCyan,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            anuncioBloc.add(AnuncioLoad());
            // return CadastroItem();
            return CadastroAnimalPage();
            //HomePage(); //BlocProvider<UserProfile>(
            //   builder: (context) => UserProfile(userRepository),
            //   child: ProfilePage(
            //     userRepository: userRepository,
            //   ),
            // );
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return LoginPage(userRepository: userRepository);
        },
      ),
    );
  }
}
