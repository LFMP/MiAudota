import 'package:miaudota_app/models/api_response.dart';

class AuthRequest {
  AuthRequest({this.username, this.password});

  bool get emailValid =>
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(username);

  Map<String, dynamic> toJson() => {
        emailValid ? 'email' : 'username': username ?? username,
        'password': password ?? password,
      };

  final String username;
  final String password;
}

class AuthResponse extends APIResponse {
  AuthResponse({
    statusCode,
    this.token,
    this.userId,
    this.realm,
  }) : super(statusCode: statusCode);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => json == null
      ? AuthResponse()
      : AuthResponse(
          token: json['id'] ?? json['id'],
          userId: json['userId'] ?? json['userId'],
          realm: json['user']['realm'] ?? json['user']['realm'],
        );

  final String token;
  final String userId;
  final String realm;

  @override
  bool get isSucessfull => statusCode == 200;

  Map<String, dynamic> toJson() => {
        'id': token ?? token,
        'userId': userId ?? userId,
        'realm': realm ?? realm,
      };
}
