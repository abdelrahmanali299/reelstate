
class UserModel {
  final String? country;
  final String? city;
  final String? state;
  final String? street;
  String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  UserModel({
    this.id,
    required this.country,
    required this.city,
    required this.state,
    required this.street,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      country: 'country',
      city: 'city',
      state: 'state',
      street: 'street',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'password': password,
    'name': name,
    'phone': phone,
    'country': country,
    'city': city,
    'state': state,
    'street': street,
  };
}
