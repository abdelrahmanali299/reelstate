import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';

part 'get_realestates_states.dart';

class GetRealestatesCubit extends Cubit<GetRealestatesStates> {
  @override
  void onChange(Change<GetRealestatesStates> change) {
    log('change: ${change.nextState}');
    super.onChange(change);
  }

  GetRealestatesCubit(this.homeRepo) : super(GetRealestatesInitial());

  final HomeRepo homeRepo;

  Future<void> getRealestates({required RealestateType? type}) async {
    emit(GetRealestatesLoading());
    var result = await homeRepo.getRealestates(type: type);
    result.fold(
      (l) => emit(GetRealestatesFailure(error: l)),
      (r) => emit(GetRealestatesSuccess(realestates: r)),
    );
  }
}
