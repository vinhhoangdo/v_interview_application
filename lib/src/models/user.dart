class User {
  final String username;
  final String id;
  final String name;
  final String password;
  final String avatarUrl;

  User({
    required this.username,
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"] != null ? json["username"] as String : "",
      id: json["id"] != null ? json["id"] as String : "",
      name: json["name"] != null ? json["name"] as String : "",
      avatarUrl: json["avatar"] != null ? json["avatar"] as String : "",
      password: json["password"] != null ? json["password"] as String : "",
    );
  }
}
