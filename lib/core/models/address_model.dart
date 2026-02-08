class AddressModel {
  String? country;
  String? city;
  String? state;
  String? street;

  AddressModel({this.country, this.city, this.state, this.street});
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      country: json['country'],
      city: json['city'],
      state: json['state'],
      street: json['street'],
    );
  }
  Map<String, dynamic> toJson() => {
    'country': country,
    'city': city,
    'state': state,
    'street': street,
  };
}
