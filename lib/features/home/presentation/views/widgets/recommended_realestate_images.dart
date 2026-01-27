import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RecommendedRealestateImages extends StatelessWidget {
  const RecommendedRealestateImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2,
        viewportFraction: .7,
      ),
      itemCount: 15,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Image.asset('assets/images/reelstate_img.png', fit: BoxFit.fill),
    );
  }
}
