part of 'filter_realestates_cubit.dart';

@immutable
abstract class FilterRealestatesState {}

class FilterRealestatesCubitInitial extends FilterRealestatesState {}

class FilterRealestatesCubitLoading extends FilterRealestatesState {}

class FilterRealestatesCubitSuccess extends FilterRealestatesState {
  final List<RealestateModel> realestates;
  FilterRealestatesCubitSuccess({required this.realestates});
}

class FilterRealestatesCubitFailure extends FilterRealestatesState {
  final String message;
  FilterRealestatesCubitFailure({required this.message});
}
