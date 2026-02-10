import 'package:flutter/material.dart';
import 'package:reelstate/features/auth/presentation/view/sign_in_view.dart';
import 'onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Skip
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInView()),
                  );
                },
                child: const Text("Skip"),
              ),
            ),

            /// Pages
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                children: [
                  OnboardingPage(
                    image: "assets/images/onboarding.png",
                    title: "ابحث عن منزل احلامك",
                    subtitle:
                        "استكشف مجموعة كبيرة من الڤلل والشقق الفاخرة للبيع أو الإيجار بما يناسب أسلوب حياتك.",
                  ),

                  OnboardingPage(
                    showLottie: true,
                    image: "assets/lottie/Marketing.json",
                    title: "البحث الذكي",
                    subtitle:
                        "ابحث عن منزلك المثالي بسهولة باستخدام البحث الذكي والفلاتر المتقدمة حسب السعر والمنطقة.",
                  ),

                  OnboardingPage(
                    showLottie: true,
                    image: "assets/lottie/mobile.json",
                    title: "تواصل معانا",
                    subtitle:
                        "تواصل مباشرة مع الوسطاء المعتمدين وملاك العقارات عبر الدردشة الفورية لترتيب المعاينات",
                  ),
                ],
              ),
            ),

            /// Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: currentIndex == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.cyan
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentIndex == 2
                        ? Colors.blue
                        : Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    currentIndex == 2 ? "Get Started" : "Next",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
