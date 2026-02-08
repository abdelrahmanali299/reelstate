import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reelstate/core/services/fire_store_service.dart';
import 'package:reelstate/core/services/get_it_service.dart';
import 'package:reelstate/core/utils/models/realstate_address_model.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/layout/presentation/views/layout_view.dart';
import 'package:reelstate/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GetItService.init();
  await FireStoreService().addData(
    id: '3253554',
    path: 'realestate',
    data: RealestateModel(
      title: 'شقة تمليك',
      price: 30000,
      type: RealestateType.tamleek,
      images: [
        'assets/images/reelstate_img.png',
        'assets/images/reelstate_img.png',
        'assets/images/reelstate_img.png',
      ],
      roomsNumber: 5,
      bathroomsNumber: 3,
      area: 130,
      desc:
          'شقة فاخرة تقع في قلب حي العليا، تتميز بتصميم عصري وتشطيبات عالية الجودة. الشقة في الطابق الرابع وتطل على حديقة الحي، مما يوفر هدوءاً وخصوصية تامة.',
      address: RealstateAddressModel(
        street: 'شارع محمد سلمى',
        city: 'المحلة الكبرى',
        state: 'الغربية',
        country: 'مصر',
      ),
      id: 3253554,
      date: DateTime.now(),
    ).toJson(),
  );

  await FireStoreService().addData(
    id: '32535',
    path: 'realestate',
    data: RealestateModel(
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
    ).toJson(),
  );

  await FireStoreService().addData(
    id: '3253333',
    path: 'realestate',
    data: RealestateModel(
      title: 'شقة ايجار',
      price: 30000,
      type: RealestateType.egar,
      images: [
        'assets/images/reelstate_img.png',
        'assets/images/reelstate_img.png',
        'assets/images/reelstate_img.png',
      ],
      roomsNumber: 7,
      bathroomsNumber: 3,
      area: 250,
      desc:
          'شقة فاخرة تقع في قلب حي العليا، تتميز بتصميم عصري وتشطيبات عالية الجودة. الشقة في الطابق الرابع وتطل على حديقة الحي، مما يوفر هدوءاً وخصوصية تامة.',
      address: RealstateAddressModel(
        street: 'شارع محمد سلمى',
        city: 'المحلة الكبرى',
        state: 'الغربية',
        country: 'مصر',
      ),
      id: 3253333,
      date: DateTime.now(),
    ).toJson(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: LayoutView(),
    );
  }
}
