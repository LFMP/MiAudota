import 'package:flutter/material.dart';
import 'package:miaudota_app/blocs/authentication.dart';
import 'package:miaudota_app/blocs/events/authentication.dart';
import 'package:miaudota_app/blocs/states/authentication.dart';
import 'package:miaudota_app/pages/blank_page.dart';
import 'package:miaudota_app/pages/login_page.dart';
import 'package:miaudota_app/pages/splash_page.dart';
import 'package:miaudota_app/repositories/usuario.dart';
import 'package:miaudota_app/utils/loading.dart';
import 'package:miaudota_app/utils/style.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UsuarioRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: MiAudota(userRepository: userRepository),
    ),
  );
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
            return BlankPage();
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
