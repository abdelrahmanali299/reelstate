import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reelstate/core/models/address_model.dart';

class RealestateModel {
  final String title;
  final num price;
  final RealestateType type;
  final List<String> images;
  final int roomsNumber;
  final int bathroomsNumber;
  final num area;
  final String desc;
  final AddressModel address;
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
    final dynamic dateValue = json['date'];
    DateTime parsedDate;
    if (dateValue is Timestamp) {
      parsedDate = dateValue.toDate();
    } else if (dateValue is int) {
      parsedDate = DateTime.fromMillisecondsSinceEpoch(dateValue);
    } else if (dateValue is String) {
      parsedDate =
          DateTime.tryParse(dateValue) ??
          DateTime.fromMillisecondsSinceEpoch(int.tryParse(dateValue) ?? 0);
    } else if (dateValue is DateTime) {
      parsedDate = dateValue;
    } else {
      parsedDate = DateTime.now();
    }

    return RealestateModel(
      title: json['title'],
      price: json['price'],
      type: RealestateType.values.byName(json['type']),
      images: List<String>.generate(
        json['images'].length,
        (i) => json['images'][i],
      ),
      roomsNumber: json['roomsNumber'],
      bathroomsNumber: json['bathroomsNumber'],
      area: json['area'],
      desc: json['desc'],
      address: AddressModel.fromJson(json['address']),
      id: json['id'],
      date: parsedDate,
      isFav: json['isFav'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'type': type.name,
      'images': images,
      'roomsNumber': roomsNumber,
      'bathroomsNumber': bathroomsNumber,
      'area': area,
      'desc': desc,
      'address': address.toJson(),
      'id': id,
      'date': Timestamp.fromDate(date),
      'isFav': isFav,
    };
  }
}

enum RealestateType { tamleek, egar }
