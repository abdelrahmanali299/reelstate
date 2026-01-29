import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/widgets/custom_back_button.dart';
import 'package:reelstate/core/utils/widgets/custom_favarate_icon.dart';
import 'package:reelstate/features/home/presentation/views/widgets/dot_indicator_section.dart';

class ProductDetailsImages extends StatelessWidget {
  final int productIndex;
  const ProductDetailsImages({super.key, this.productIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Hero(
                tag: 'product_image_$productIndex',
                child: Image.asset(
                  'assets/images/reelstate_img.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),

        Positioned(bottom: 20, right: 0, left: 0, child: DotIndicatorSection()),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CustomBackButton(),
          ),
        ),

        Positioned(left: 10, top: 10, child: CustomFavarateIcon(isFav: false)),
      ],
    );
  }
}
