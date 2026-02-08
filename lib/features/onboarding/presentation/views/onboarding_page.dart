import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,

    this.showLottie = false,
  });
  final bool showLottie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: showLottie
                  ? Lottie.asset(image)
                  : Image.asset(image, height: 260, fit: BoxFit.cover),
            ),

          const SizedBox(height: 32),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
