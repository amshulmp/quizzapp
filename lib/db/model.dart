class DetialsModel {
  int? id;
  String email;
  String password;
  String name;
  String nickname;
  String phone;

  DetialsModel(
      {this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.nickname,
      required this.phone});

  // Convert the model to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'nickname': nickname,
      'phone': phone,
    };
  }

  // Create a model from a map retrieved from the database
  factory DetialsModel.fromMap(Map<String, dynamic> map) {
    return DetialsModel(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      name: map['name'],
      nickname: map['nickname'],
      phone: map['phone'],
    );
  }
}
