import 'package:reelstate/core/models/address_model.dart';

class UserModel {
  final AddressModel addressModel;
  String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  UserModel({
    this.id,
    required this.addressModel,
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
      addressModel: AddressModel.fromJson(json['addressModel'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'password': password,
    'name': name,
    'phone': phone,
    'addressModel': addressModel.toJson(),
  };
}
