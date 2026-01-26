import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custom_favarate_icon.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffE5E7EB)),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/reelstate_img.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '1,200,000 جنيه',
                  style: AppTextStyles.bold16.copyWith(
                    color: Colors.blue,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'شقة للبيع ممتازة في وسط المدينة بمساحة 120 متر مربع',
                  style: AppTextStyles.semiBold14.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'المدينة، القاهرة',
                  style: AppTextStyles.semiBold12.copyWith(
                    overflow: TextOverflow.ellipsis,
                    color: Color(0xff64748B),
                  ),
                ),
              ),
            ],
          ),
          Positioned(top: 8, right: 5, child: CustomFavarateIcon()),
        ],
      ),
    );
  }
}
