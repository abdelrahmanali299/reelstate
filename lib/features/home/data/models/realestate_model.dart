import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reelstate/core/models/address_model.dart';

class RealestateModel {
  String? title;
  num? price;
  RealestateType? type;
  List<String>? images;
  int? roomsNumber;
  int? bathroomsNumber;
  num? area;
  String? desc;
  AddressModel? address;
  int? id;
  DateTime? date;
  bool? isFav;
  int? minArea;
  int? maxArea;
  int? minPrice;
  int? maxPrice;

  RealestateModel({
    this.title,
    this.price,
    this.type,
    this.images,
    this.roomsNumber,
    this.bathroomsNumber,
    this.area,
    this.desc,
    this.address,
    this.id,
    this.date,
    this.isFav = false,
    this.minArea,
    this.maxArea,
    this.maxPrice,
    this.minPrice,
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
      minArea: json['minArea'],
      maxArea: json['maxArea'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
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
      'type': type?.name,
      'images': images,
      'roomsNumber': roomsNumber,
      'bathroomsNumber': bathroomsNumber,
      'area': area,
      'desc': desc,
      'minArea': minArea,
      'maxArea': maxArea,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'address': address?.toJson(),
      'id': id,
      'date': Timestamp.fromDate(date ?? DateTime.now()),
      'isFav': isFav,
    };
  }
}

enum RealestateType { tamleek, egar }
