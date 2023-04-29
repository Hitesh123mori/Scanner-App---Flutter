class UserId{
  static String uid = "";
}

class User{
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String password;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.password});

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'email': email,
    'phone': phone,
    'password': password,

  };

  static User fromJson(Map<String, dynamic> json) => User(
    uid: json['uid'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    password: json['password'],
  );

}