import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reelstate/core/models/address_model.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';

part 'request_realestate_state.dart';

class RequestRealestateCubit extends Cubit<RequestRealestateState> {
  @override
  void onChange(Change<RequestRealestateState> change) {
    super.onChange(change);
    log(change.toString());
  }

  RequestRealestateCubit(this.homeRepo) : super(RequestRealestateInitial());
  final HomeRepo homeRepo;
  RealestateModel realestateModel = RealestateModel(address: AddressModel());
  void requestRealestate() async {
    emit(RequestRealestateLoading());

    var res = await homeRepo.requestMyRealestate(
      realestateModel: realestateModel,
    );
    res.fold((failure) => emit(RequestRealestateError(failure)), (success) {
      log(realestateModel.toJson().toString());
      emit(RequestRealestateSuccess());
    });
  }
}
