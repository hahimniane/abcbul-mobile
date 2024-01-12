class ApiResponse {
  final bool success;
  final String token;
  final UserData user;

  ApiResponse({
    required this.success,
    required this.token,
    required this.user,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      token: json['token'],
      user: UserData.fromJson(json['user']),
    );
  }
}

class UserData {
  final int id;
  final String name;
  // Add other user-related fields here

  UserData({
    required this.id,
    required this.name,
    // Initialize other user-related fields here
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      // Parse other user-related fields from the JSON
    );
  }
}
