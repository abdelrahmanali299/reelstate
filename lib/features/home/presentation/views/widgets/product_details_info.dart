import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/views/widgets/details_container.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key, required this.realestateModel});
  final RealestateModel realestateModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            '${realestateModel.price} جنيه',
            style: AppTextStyles.extraBold20.copyWith(color: Colors.blue),
          ),
          subtitle: Text(realestateModel.title, style: AppTextStyles.bold18),
          trailing: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE5E7EB)),
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF1F5F9),
            ),
            child: Text(
              realestateModel.type == RealestateType.egar ? 'ايجار' : 'تمليك',
              style: AppTextStyles.bold12.copyWith(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 10),
        Divider(color: Color(0xffE5E7EB)),
        SizedBox(height: 20),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: DetailsContainer(
                title: 'غرف',
                num: realestateModel.roomsNumber.toString(),
              ),
            ),
            Expanded(
              child: DetailsContainer(
                title: 'دورات المياه',
                num: realestateModel.bathroomsNumber.toString(),
              ),
            ),
            Expanded(
              child: DetailsContainer(
                title: 'المساحه',
                num: '${realestateModel.area} م²',
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text('الوصف', style: AppTextStyles.bold18),
        SizedBox(height: 8),
        Text(
          realestateModel.desc,
          style: AppTextStyles.regular16.copyWith(color: Color(0xff475569)),
        ),
      ],
    );
  }
}
