class UserRegister {
  String name;
  String username;
  String contact;
  String? idNumber;
  String email;
  String city;
  String password;
  String resetToken;
  String token;
  String expiresAt;
  String image;
  bool status;
  int projectCompleted;
  String id;
  String createdAt;
  String updatedAt;

  UserRegister({
    required this.name,
    required this.username,
    required this.contact,
    required this.idNumber,
    required this.email,
    required this.city,
    required this.password,
    required this.resetToken,
    required this.token,
    required this.expiresAt,
    required this.image,
    required this.status,
    required this.projectCompleted,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      name: json['name'],
      username: json['username'],
      contact: json['contact'],
      idNumber: json['id_number'],
      email: json['email'],
      city: json['city'],
      password: json['password'],
      resetToken: json['reset_token'],
      token: json['token'],
      expiresAt: json['expires_at'],
      image: json['image'],
      status: json['status'],
      projectCompleted: json['project_completed'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class SignUpResult {
  final bool success;
  final UserRegister? user;
  final String? failureReason;

  SignUpResult({required this.success, this.user, this.failureReason});

  factory SignUpResult.fromJson(Map<String, dynamic> json) {
    return SignUpResult(
      success: json['status'] == 200,
      user: json['status'] == 200
          ? UserRegister.fromJson(json['register'])
          : null,
      failureReason: json['status'] != 200 ? json['message'] : null,
    );
  }
}
