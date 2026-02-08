import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custom_button.dart';
import 'package:reelstate/features/home/presentation/views/widgets/request_realestate_indecator.dart';
import 'package:reelstate/features/home/presentation/views/widgets/request_realestate_page_view.dart';

class RequestYourRealestateBody extends StatefulWidget {
  const RequestYourRealestateBody({super.key});

  @override
  State<RequestYourRealestateBody> createState() =>
      _RequestYourRealestateBodyState();
}

class _RequestYourRealestateBodyState extends State<RequestYourRealestateBody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text('اطلب شقة', style: AppTextStyles.extraBold20),
                subtitle: Text(
                  'اخبرنا عن شقتك ونقدم لك أفضل الخدمات',
                  style: AppTextStyles.bold14.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              RequestRealestateIndecator(currentindex: currentIndex),
              SizedBox(height: 5),
              Text(
                'خطوة ${currentIndex + 1} من 3',
                style: AppTextStyles.bold12.copyWith(color: Colors.grey),
              ),
              Divider(color: Color(0xffE5E7EB)),
              Expanded(
                child: RequestRealestatePageView(
                  pageController: pageController,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: CustomButton(
              onTap: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              borderColor: Colors.blue,
              title: currentIndex == 1 ? 'ارسال' : 'استمرار',
              color: Colors.blue,
              titleColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
