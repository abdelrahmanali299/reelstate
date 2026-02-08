import 'package:csc_picker_plus/csc_picker_plus.dart';
import 'package:flutter/material.dart';

class PickLocation extends StatelessWidget {
  const PickLocation({
    super.key,
    required this.onCountryChanged,
    required this.onStateChanged,
    required this.onCityChanged,
  });

  final Function(String?) onCountryChanged;
  final Function(String?) onStateChanged;
  final Function(String?) onCityChanged;

  @override
  Widget build(BuildContext context) {
    return CSCPickerPlus(
      cityLanguage: CityLanguage.native,
      countryStateLanguage: CountryStateLanguage.arabic,
      onCountryChanged: onCountryChanged,
      onStateChanged: onStateChanged,
      onCityChanged: onCityChanged,
    );
  }
}
