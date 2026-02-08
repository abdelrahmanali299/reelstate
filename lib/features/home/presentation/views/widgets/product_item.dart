import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custom_favarate_icon.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.productIndex = 0,
    required this.realestateModel,
  });
  final int productIndex;
  final RealestateModel realestateModel;
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
                child: Hero(
                  tag: 'product_image_$productIndex',
                  child: Image.asset(
                    'assets/images/reelstate_img.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${realestateModel.price} جنيه',
                  style: AppTextStyles.bold16.copyWith(
                    color: Colors.blue,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  realestateModel.title,
                  style: AppTextStyles.semiBold14.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${realestateModel.address.country}, ${realestateModel.address.state}, ${realestateModel.address.city}',
                  style: AppTextStyles.semiBold12.copyWith(
                    overflow: TextOverflow.ellipsis,
                    color: Color(0xff64748B),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 5,
            child: CustomFavarateIcon(isFav: realestateModel.isFav),
          ),
        ],
      ),
    );
  }
}
