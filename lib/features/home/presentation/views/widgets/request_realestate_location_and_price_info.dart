import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/pick_location.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/request_realestate_cubit/request_realestate_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/custom_area_box.dart';

class RequestRealestateLocationAndPriceInfo extends StatefulWidget {
  const RequestRealestateLocationAndPriceInfo({super.key});

  @override
  State<RequestRealestateLocationAndPriceInfo> createState() =>
      _RequestRealestateLocationAndPriceInfoState();
}

class _RequestRealestateLocationAndPriceInfoState
    extends State<RequestRealestateLocationAndPriceInfo> {
  double minPrice = 0;
  double maxPrice = 1000;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestRealestateCubit>();
    RealestateModel realestateModel = cubit.realestateModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "📍 الموقع",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        PickLocation(
          onCountryChanged: (value) => realestateModel.address?.country = value,
          onStateChanged: (value) => realestateModel.address?.state = value,
          onCityChanged: (value) => realestateModel.address?.city = value,
        ),
        SizedBox(height: 20),

        Divider(),
        SizedBox(height: 20),

        Row(
          children: [
            const Icon(Icons.square_foot, color: Colors.blue),
            const SizedBox(width: 8),
            const Text("السعر", style: AppTextStyles.bold18),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAreaBox(area: minPrice),
            CustomAreaBox(area: maxPrice),
          ],
        ),

        RangeSlider(
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          values: RangeValues(minPrice, maxPrice),
          min: 0,
          max: 1000,
          divisions: 48,
          onChanged: (value) {
            setState(() {
              minPrice = value.start;
              maxPrice = value.end;
              realestateModel.minPrice = minPrice.toInt();
              realestateModel.maxPrice = maxPrice.toInt();
            });
          },
        ),
      ],
    );
  }
}
