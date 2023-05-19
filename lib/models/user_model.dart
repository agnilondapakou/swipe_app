class UserModel {
  final int id;
  final String username;
  final String email;
  final String phone_number;
  final String type;
  final String password;
  final String source;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone_number,
    required this.type,
    required this.password,
    required this.source
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone_number: json['phone_number'],
      type: json['type'],
      password: json['password'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'phone_number': phone_number,
    'type': type,
    'password': password,
    'source': source,

  };
}

