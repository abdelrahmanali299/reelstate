import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reelstate/core/utils/app_text_styles.dart';
import 'package:reelstate/core/utils/widgets/custem_text_field.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/presentation/manager/home_cubits/filter_realestates_cubit/filter_realestates_cubit.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.title,
    required this.type,
    required this.isActive,
  });
  final String title;
  final RealestateType? type;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildBottomSheet(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE5E7EB)),
          borderRadius: BorderRadius.circular(9999),
          color: isActive ? Colors.blue : Colors.transparent,
        ),
        child: Row(
          spacing: 5,
          children: [
            Text(
              title,
              style: AppTextStyles.semiBold14.copyWith(
                color: isActive ? Colors.white : Colors.blue,
              ),
            ),
            Icon(
              isActive
                  ? Icons.arrow_drop_up_rounded
                  : Icons.arrow_drop_down_rounded,
              color: isActive ? Colors.white : Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  void buildBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (innerContext) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: double.infinity,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: List.generate(
            2,
            (i) => Expanded(
              child: GestureDetector(
                onTap: () {
                  switch (title) {
                    case 'السعر':
                      context
                          .read<FilterRealestatesCubit>()
                          .getRealestatesOrderByPrice(
                            descending: i == 0 ? true : false,
                            type: type,
                          );
                    case 'المساحة':
                      context
                          .read<FilterRealestatesCubit>()
                          .getRealestatesOrderByArea(
                            descending: i == 0 ? true : false,
                            type: type,
                          );
                    case 'المكان':
                      context
                          .read<FilterRealestatesCubit>()
                          .getRealestatesOrderByPrice(
                            descending: i == 0 ? true : false,
                            type: type,
                          );

                      break;
                    default:
                  }
                },
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  hint: i == 0 ? 'من' : 'الى',
                  hintStyle: AppTextStyles.bold16.copyWith(color: Colors.blue),
                  borderColor: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/* Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(9999),
                  color:
                      isActive &&
                          i ==
                              context
                                  .read<FilterRealestatesCubit>()
                                  .currentSubCategoryIndex
                      ? Colors.blue
                      : Colors.transparent,
                ),
                child: Row(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      i != 0 ? 'اقل لاعلي' : 'اعلي لاقل',
                      style: AppTextStyles.bold14.copyWith(
                        color:
                            isActive &&
                                i ==
                                    context
                                        .read<FilterRealestatesCubit>()
                                        .currentSubCategoryIndex
                            ? Colors.white
                            : Colors.blue,
                      ),
                    ),
                    Visibility(
                      visible:
                          isActive &&
                          i ==
                              context
                                  .read<FilterRealestatesCubit>()
                                  .currentSubCategoryIndex,
                      child: GestureDetector(
                        child: Icon(Icons.close, color: Colors.white),
                        onTap: () {
                          Navigator.pop(context);
                          context
                                  .read<FilterRealestatesCubit>()
                                  .currentSubCategoryIndex =
                              context
                                      .read<FilterRealestatesCubit>()
                                      .currentCategoryIndex =
                                  -1;
                          context.read<GetRealestatesCubit>().getRealestates(
                            type: type,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),*/ 