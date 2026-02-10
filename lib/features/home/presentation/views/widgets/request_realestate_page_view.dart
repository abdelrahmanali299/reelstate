import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/views/widgets/realestate_request_details.dart';
import 'package:reelstate/features/home/presentation/views/widgets/request_realestate_location_and_price_info.dart';
import 'package:reelstate/features/home/presentation/views/widgets/success_sign.dart';

class RequestRealestatePageView extends StatelessWidget {
  const RequestRealestatePageView({super.key, required this.pageController});
  final PageController pageController;
  final List<Widget> pages = const [
    RealestateRequestDetails(),
    RequestRealestateLocationAndPriceInfo(),
    SuccessRequest(),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) => pages[index],
      itemCount: pages.length,
    );
  }
}

class SuccessRequest extends StatelessWidget {
  const SuccessRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SuccessSign(),
              Text('تم ارسال طلبك بنجاح', style: AppTextStyles.extraBold24),
              Text(
                textAlign: TextAlign.center,
                'سيقوم فريقنا بالتواصل معك خلال 24 ساعة وتقديم أفضل الخيارات العقارية المناسبة لمتطلباتك.',
                style: AppTextStyles.bold14.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: IntrinsicWidth(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[100],
                        ),
                        child: Icon(Icons.message_outlined, color: Colors.blue),
                      ),
                      Flexible(
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• سيقوم فريقنا بمراجعة طلبك',
                              style: AppTextStyles.bold14,
                            ),
                            Text(
                              textAlign: TextAlign.right,
                              '• ستصلك ترشيحات عقارية مخصّصة تناسب متطلباتك',
                              style: AppTextStyles.bold14,
                            ),
                            Text(
                              '• تابع الاشعارات',
                              style: AppTextStyles.bold14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Lottie.asset('assets/lottie/celebration_confetti.json'),
      ],
    );
  }
}
