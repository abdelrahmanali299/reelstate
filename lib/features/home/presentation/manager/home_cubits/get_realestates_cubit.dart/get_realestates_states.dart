part of 'get_realestates_cubit.dart';

@immutable
abstract class GetRealestatesStates {}

class GetRealestatesInitial extends GetRealestatesStates {}

class GetRealestatesLoading extends GetRealestatesStates {}

class GetRealestatesSuccess extends GetRealestatesStates {
  final List<RealestateModel> realestates;
  GetRealestatesSuccess({required this.realestates});
}

class GetRealestatesFailure extends GetRealestatesStates {
  final String error;
  GetRealestatesFailure({required this.error});
}
