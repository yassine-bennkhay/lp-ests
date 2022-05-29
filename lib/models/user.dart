class User {
  int id;
  String email;
  User({required this.id, required this.email});
  factory User.fromJson(Map<String, dynamic> userJson) {
    return User(id: userJson['id'], email: userJson['email']);
  }
}
