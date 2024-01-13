class UserProfile {
  final int id;
  final String name;
  final String username;
  final String role;
  final String email;
  final String contact;
  final String city;
  final String password;
  final String resetToken;
  final String token;
  final String expiresAt;
  final String image;
  final String idNumber;
  final bool status;
  final int stars;
  final int projectCompleted;
  final String createdAt;
  final String updatedAt;
  final List<String> reviews;

  UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.role,
    required this.email,
    required this.contact,
    required this.city,
    required this.password,
    required this.resetToken,
    required this.token,
    required this.expiresAt,
    required this.image,
    required this.idNumber,
    required this.status,
    required this.stars,
    required this.projectCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['user']['id'],
      name: json['user']['name'],
      username: json['user']['username'],
      role: json['user']['role'],
      email: json['user']['email'],
      contact: json['user']['contact'],
      city: json['user']['city'],
      password: json['user']['password'],
      resetToken: json['user']['reset_token'],
      token: json['user']['token'],
      expiresAt: json['user']['expires_at'],
      image: json['user']['image'],
      idNumber: json['user']['id_number'],
      status: json['user']['status'],
      stars: json['user']['stars'],
      projectCompleted: json['user']['project_completed'],
      createdAt: json['user']['created_at'],
      updatedAt: json['user']['updated_at'],
      reviews: List<String>.from(json['user']['reviews']),
    );
  }
}
