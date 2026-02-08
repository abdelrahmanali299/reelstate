import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';

part 'filter_realestates_state.dart';

class FilterRealestatesCubit extends Cubit<FilterRealestatesState> {
  @override
  void onChange(Change<FilterRealestatesState> change) {
    log('change: ${change.nextState}');
    super.onChange(change);
  }

  FilterRealestatesCubit(this.homeRepo)
    : super(FilterRealestatesCubitInitial());

  final HomeRepo homeRepo;
  int currentCategoryIndex = -1;
  int currentSubCategoryIndex = -1;

  getRealestatesOrderByPrice({
    required bool descending,
    required RealestateType? type,
  }) async {
    emit(FilterRealestatesCubitLoading());
    var result = await homeRepo.getRealestatesOrderByPrice(
      descending: descending,
      type: type,
    );
    result.fold((l) => emit(FilterRealestatesCubitFailure(message: l)), (r) {
      currentCategoryIndex = 0;
      emit(FilterRealestatesCubitSuccess(realestates: r));
    });
  }

  getRealestatesOrderByArea({
    required bool descending,
    required RealestateType? type,
  }) async {
    emit(FilterRealestatesCubitLoading());
    var result = await homeRepo.getRealestatesOrderByArea(
      type: type,
      descending: descending,
    );
    result.fold((l) => emit(FilterRealestatesCubitFailure(message: l)), (r) {
      currentCategoryIndex = 1;
      emit(FilterRealestatesCubitSuccess(realestates: r));
    });
  }
}
