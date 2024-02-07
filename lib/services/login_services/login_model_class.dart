class LoginApiResponse {
  final bool success;
  final String token;
  final UserData user;

  LoginApiResponse({
    required this.success,
    required this.token,
    required this.user,
  });

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) {
    return LoginApiResponse(
      success: json['success'],
      token: json['token'],
      user: UserData.fromJson(json['user']),
    );
  }
}

class UserData {
  final String id;
  final String name;
  final String contact;
  final String email;
  final String city;
  final String password;
  final String resetToken;
  final String userToken;
  final String expiresAt;
  final String image;
  final bool status;
  final int projectCompleted;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.contact,
    required this.email,
    required this.city,
    required this.password,
    required this.resetToken,
    required this.userToken,
    required this.expiresAt,
    required this.image,
    required this.status,
    required this.projectCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
      contact: json['contact'] ?? "",
      email: json['email'] ?? "",
      city: json['city'] ?? "",
      password: json['password'] ?? "",
      resetToken: json['reset_token'] ?? "",
      userToken: json['token'] ?? "",
      expiresAt: json['expires_at'] ?? "",
      image: json['image'] ?? "",
      status: json['status'] ?? false,
      projectCompleted: json['project_completed'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updateAt'] ?? "",
    );
  }
}
