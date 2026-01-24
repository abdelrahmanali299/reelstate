import 'package:flutter/material.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(Icons.search, color: Color(0xff878B94)),
      trailing: [Icon(Icons.menu, color: Colors.blue)],
      elevation: WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      hintText: 'Search for your dream home...',
      hintStyle: WidgetStatePropertyAll(
        AppTextStyles.regular16.copyWith(color: Color(0xff878B94)),
      ),
    );
  }
}
