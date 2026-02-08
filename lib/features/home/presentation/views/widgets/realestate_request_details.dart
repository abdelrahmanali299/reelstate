import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/request_realestate_cubit/request_realestate_cubit.dart';
import 'package:reelstate/features/home/presentation/views/widgets/custom_area_box.dart';
import 'package:reelstate/features/home/presentation/views/widgets/custom_type_box.dart';

class RealestateRequestDetails extends StatefulWidget {
  const RealestateRequestDetails({super.key});

  @override
  State<RealestateRequestDetails> createState() =>
      _RealestateRequestDetailsState();
}

class _RealestateRequestDetailsState extends State<RealestateRequestDetails> {
  double minArea = 20;
  double maxArea = 1000;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestRealestateCubit>();
    RealestateModel realestateModel = cubit.realestateModel;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          const Text(
            "تفاصيل العقار",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          _buildStepper(
            icon: Icons.bed,
            label: "عدد الغرف",
            value: realestateModel.roomsNumber ?? 0,
            onMinus: () {
              if (realestateModel.roomsNumber! > 0) {
                setState(() {
                  realestateModel.roomsNumber =
                      (realestateModel.roomsNumber ?? 0) - 1;
                });
              }
            },
            onPlus: () => setState(
              () => realestateModel.roomsNumber =
                  (realestateModel.roomsNumber ?? 0) + 1,
            ),
          ),

          const SizedBox(height: 16),

          _buildStepper(
            icon: Icons.bathtub,
            label: "عدد الحمّامات",
            value: realestateModel.bathroomsNumber ?? 0,
            onMinus: () {
              if (realestateModel.bathroomsNumber! > 0) {
                setState(() {
                  realestateModel.bathroomsNumber =
                      (realestateModel.bathroomsNumber ?? 0) - 1;
                });
              }
            },
            onPlus: () => setState(
              () => realestateModel.bathroomsNumber =
                  (realestateModel.bathroomsNumber ?? 0) + 1,
            ),
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTypeBox(type: 'تمليك'),
              CustomTypeBox(type: 'ايجار'),
            ],
          ),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 20),

          Row(
            children: [
              const Icon(Icons.square_foot, color: Colors.blue),
              const SizedBox(width: 8),
              const Text("المساحة (م²)", style: AppTextStyles.bold18),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAreaBox(area: minArea),
              CustomAreaBox(area: maxArea),
            ],
          ),

          RangeSlider(
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            values: RangeValues(minArea, maxArea),
            min: 20,
            max: 1000,
            divisions: 48,
            onChanged: (value) {
              setState(() {
                minArea = value.start;
                maxArea = value.end;
                realestateModel.minArea = minArea.toInt();
                realestateModel.maxArea = maxArea.toInt();
              });
            },
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildStepper({
    required IconData icon,
    required String label,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 8),
              Text(label, style: AppTextStyles.bold18),
            ],
          ),
          Row(
            children: [
              _circleButton(Icons.add, onPlus),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "$value",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _circleButton(Icons.remove, onMinus),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(icon, size: 18, color: Colors.blue),
      ),
    );
  }
}
