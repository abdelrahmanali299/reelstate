import 'package:reelstate/core/utils/models/realstate_address_model.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';

List<RealestateModel> getDummyRealestates() {
  return List.generate(
    5,
    (index) => RealestateModel(
      title: 'شقة تمليك',
      price: 530000,
      type: RealestateType.tamleek,
      images: [
        'assets/images/reelstate_img.png',
        'assets/images/reelstate_img.png',
        'assets/images/reelstate_img.png',
      ],
      roomsNumber: 3,
      bathroomsNumber: 1,
      area: 180,
      desc:
          'شقة فاخرة تقع في قلب حي العليا، تتميز بتصميم عصري وتشطيبات عالية الجودة. الشقة في الطابق الرابع وتطل على حديقة الحي، مما يوفر هدوءاً وخصوصية تامة.',
      address: RealstateAddressModel(
        street: 'شارع محمد سلمى',
        city: 'المحلة الكبرى',
        state: 'الغربية',
        country: 'مصر',
      ),
      id: 32535,
      date: DateTime.now(),
    ),
  );
}
