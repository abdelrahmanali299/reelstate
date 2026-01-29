import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';

part 'get_realestates_states.dart';

class GetRealestatesCubit extends Cubit<GetRealestatesStates> {
  GetRealestatesCubit(this.homeRepo) : super(GetRealestatesInitial());

  final HomeRepo homeRepo;

  Future<void> getRealestates() async {
    emit(GetRealestatesLoading());

    var res = await homeRepo.getAllRealestates();
    res.fold(
      (l) => emit(GetRealestatesFailure(error: l)),
      (r) => emit(GetRealestatesSuccess(realestates: r)),
    );
  }

  Future<void> getEgarRealestates() async {
    emit(GetRealestatesLoading());

    var res = await homeRepo.getEgarRealestates();
    res.fold(
      (l) => emit(GetRealestatesFailure(error: l)),
      (r) => emit(GetRealestatesSuccess(realestates: r)),
    );
  }

  Future<void> getTamleekRealestates() async {
    emit(GetRealestatesLoading());
    var res = await homeRepo.getTamleekRealestates();
    res.fold(
      (l) => emit(GetRealestatesFailure(error: l)),
      (r) => emit(GetRealestatesSuccess(realestates: r)),
    );
  }
}
