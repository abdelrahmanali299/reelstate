import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class PickLocation extends StatelessWidget {
  const PickLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      layout: Layout.horizontal,
      dropdownDecoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue),
      ),
      disabledDropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
      ),
      selectedItemStyle: AppTextStyles.regular16,
      dropdownHeadingStyle: AppTextStyles.bold16,
      dropdownItemStyle: AppTextStyles.regular16,
      countrySearchPlaceholder: "ابحث عن الدولة",
      stateSearchPlaceholder: "ابحث عن المحافظة",
      citySearchPlaceholder: "ابحث عن المدينة",

      countryDropdownLabel: "اختر الدولة",
      stateDropdownLabel: "اختر المحافظة",
      cityDropdownLabel: "اختر المدينة",

      onCountryChanged: (value) {},
      onStateChanged: (value) {},
      onCityChanged: (value) {},
    );
  }
}
