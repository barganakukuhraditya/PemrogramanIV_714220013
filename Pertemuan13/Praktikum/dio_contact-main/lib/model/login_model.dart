// DIGUNAKAN UNTUK FORM LOGIN
class LoginInput {
  final String username;
  final String password;

  LoginInput({
    required this.username,
    required this.password,
  });

  // Converts LoginInput to a JSON map
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

// DIGUNAKAN UNTUK RESPONSE
class LoginResponse {
  final String? token;
  final String message;
  final int status;

  LoginResponse({
    this.token,
    required this.message,
    required this.status,
  });

  // Factory method to create a LoginResponse from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        message: json["message"],
        status: json["status"],
      );
}
