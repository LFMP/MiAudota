class Repository {
  static const API_URL = 'http://miaudota.herokuapp.com/api';
  static const API_NORMAIS = '$API_URL/Normais';
  static const API_ENTIDADES = '$API_URL/Entidades';
  static const API_USUARIOS = '$API_URL/Usuarios';
  static const API_CONTATOS = '$API_USUARIOS/\$/contatos';
  static const API_REPLACE_USER = '$API_USUARIOS/\$/replace';
  static const API_USUARIOS_LOGIN = '$API_USUARIOS/login/?include=user';
}
