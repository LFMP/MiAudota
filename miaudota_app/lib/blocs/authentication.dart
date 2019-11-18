import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:miaudota_app/blocs/events/authentication.dart';
import 'package:miaudota_app/blocs/states/authentication.dart';
import 'package:miaudota_app/repositories/auth_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.authRepository})
      : assert(authRepository != null);

  final AuthRepository authRepository;

  @override
  AuthenticationState get initialState => null;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await authRepository.hasToken();
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
