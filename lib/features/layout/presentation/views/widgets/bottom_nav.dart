import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/features/home/data/models/bottom_nav_model.dart';
import 'package:reelstate/features/layout/presentation/manager/layout/layout_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  final List<BottomNavModel> bottomNavItems = const [
    BottomNavModel(title: "الرئيسية", iconData: Icons.home_outlined),
    BottomNavModel(title: "المفضلة", iconData: Icons.favorite_outline),
    BottomNavModel(title: "محادثة", iconData: Icons.chat_bubble_outline),
    BottomNavModel(title: "حسابي", iconData: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<LayoutCubit>().currentIndex;

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        /// Bottom Bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.8),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: List.generate(bottomNavItems.length + 1, (index) {
              /// space for center button
              if (index == 2) {
                return const Expanded(child: SizedBox());
              }

              final itemIndex = index > 2 ? index - 1 : index;
              final item = bottomNavItems[itemIndex];
              final isActive = currentIndex == itemIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<LayoutCubit>().changeBottomNav(itemIndex);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.iconData,
                          size: 26,
                          color: isActive ? Colors.blue : Colors.grey.shade400,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.title ?? '',
                          style: AppTextStyles.bold10.copyWith(
                            color: isActive
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        /// Center Add Button
        Positioned(
          bottom: 38,
          child: GestureDetector(
            onTap: () {
              // your add logic
            },
            child: Material(
              elevation: 10,
              shape: const CircleBorder(),
              shadowColor: Colors.blue.withValues(alpha: .4),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(Icons.add, size: 32, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
