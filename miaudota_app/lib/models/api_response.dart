class APIResponse {
  APIResponse({this.statusCode});
  int statusCode;
  set setStatusCode(int _statusCode) => statusCode = _statusCode;
  bool get isSucessfull => statusCode == 200;
}

class APIError extends APIResponse {
  APIError({
    this.statusCode,
    this.name,
    this.message,
    this.code,
  }) : super(statusCode: statusCode);

  factory APIError.fromJson(Map<String, dynamic> json) {
    if (json == null || json['error'] == null) return null;
    json = json['error'];
    return APIError(
      statusCode: json['statusCode'] ?? json['statusCode'],
      name: json['name'] ?? json['name'],
      message: json['message'] ?? json['message'],
      code: json['code'] ?? json['code'],
    );
  }

  @override
  int statusCode;
  String name;
  String message;
  String code;

  @override
  bool get isSucessfull => false;

  Map<String, dynamic> toJson() => {
        'error': {
          'statusCode': statusCode ?? statusCode,
          'name': name ?? name,
          'message': message ?? message,
          'code': code ?? code,
        }
      };
}
