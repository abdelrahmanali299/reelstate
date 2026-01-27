class RealestateModel {
  final String title;
  final num price;
  final RealestateType type;
  final List<String> images;
  final int roomsNumber;
  final int bathroomsNumber;
  final num area;
  final String desc;
  final String address;
  final int id;
  final DateTime date;

  RealestateModel({
    required this.title,
    required this.price,
    required this.type,
    required this.images,
    required this.roomsNumber,
    required this.bathroomsNumber,
    required this.area,
    required this.desc,
    required this.address,
    required this.id,
    required this.date,
  });
  factory RealestateModel.fromJson(Map<String, dynamic> json) {
    return RealestateModel(
      title: json['title'],
      price: json['price'],
      type: json['type'],
      images: json['images'],
      roomsNumber: json['roomsNumber'],
      bathroomsNumber: json['bathroomsNumber'],
      area: json['area'],
      desc: json['desc'],
      address: json['address'],
      id: json['id'],
      date: DateTime.parse(json['date']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'type': type,
      'images': images,
      'roomsNumber': roomsNumber,
      'bathroomsNumber': bathroomsNumber,
      'area': area,
      'desc': desc,
      'address': address,
      'id': id,
      'date': date,
    };
  }
}

enum RealestateType { tamleek, egar }
