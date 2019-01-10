class Repository {
  static const API_URL = 'http://miaudota.herokuapp.com/api';
  static const API_NORMAIS = '$API_URL/Normais';
  static const API_ENTIDADES = '$API_URL/Entidades';
  static const API_USUARIOS = '$API_URL/Usuarios';
  static const API_CONTATOS = '$API_USUARIOS/\$/contatos';
  static const API_ENDERECOS = '$API_USUARIOS/\$/enderecos';
  static const API_REPLACE_USER = '$API_USUARIOS/\$/replace';
  static const API_USUARIOS_LOGIN = '$API_USUARIOS/login/?include=user';
  static const API_ANUNCIOS = '$API_URL/Anuncios';
  static const API_ANUNCIOS_FILTER =
      '$API_ANUNCIOS?filter={"include":["animal", "item"]}';
  static const API_ITEM = '$API_URL/Itens';
  static const API_ANIMAL = '$API_URL/Animais';
}
