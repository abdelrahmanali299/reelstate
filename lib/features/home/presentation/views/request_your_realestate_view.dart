import 'package:flutter/material.dart';
import 'package:reelstate/features/home/presentation/views/widgets/request_your_realestate_body.dart';

class RequestYourRealestateView extends StatelessWidget {
  const RequestYourRealestateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: RequestYourRealestateBody()));
  }
}
