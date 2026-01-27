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
  final bool isFav;

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
    this.isFav = false,
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
      isFav: json['isFav'],
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
      'isFav': isFav,
    };
  }
}

enum RealestateType { tamleek, egar }
