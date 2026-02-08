class RealstateAddressModel {
  final String? street;
  final String? city;
  final String? state;
  final String? country;

  RealstateAddressModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });
  factory RealstateAddressModel.fromJson(Map<String, dynamic> json) =>
      RealstateAddressModel(
        street: json['street'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
      );
  toJson() => {
    'street': street,
    'city': city,
    'state': state,
    'country': country,
  };
}
