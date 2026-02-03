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
}

class RealState extends StatelessWidget {
  const RealState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SignInView()),
    );
  }
}
