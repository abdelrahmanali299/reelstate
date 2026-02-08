import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:reelstate/features/auth/presentation/view/sign_in_view.dart';
import 'package:reelstate/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://tlymmshywyrmaawdgpct.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRseW1tc2h5d3lybWFhd2RncGN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk4NzM5ODcsImV4cCI6MjA4NTQ0OTk4N30.HASvC7DaqNSmjUJHM1o3n-hyY4kcqyrRv6Lgkm8ncXY',
  );
  runApp(const RealState());
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
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

class RealState extends StatelessWidget {
  const RealState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SignInView()),
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
