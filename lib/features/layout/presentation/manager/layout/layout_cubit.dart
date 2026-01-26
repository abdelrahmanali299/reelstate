import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:reelstate/features/home/presentation/views/widgets/home_view_body.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  List<Widget> screens = [
    HomeViewBody(),
    Container(),
    Container(),
    Container(),
  ];
  int currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}
