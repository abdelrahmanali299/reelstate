part of 'request_realestate_cubit.dart';

@immutable
abstract class RequestRealestateState {}

class RequestRealestateInitial extends RequestRealestateState {}

class RequestRealestateLoading extends RequestRealestateState {}

class RequestRealestateSuccess extends RequestRealestateState {
  final RealestateModel realestateModel;
  RequestRealestateSuccess(this.realestateModel);
}

class RequestRealestateError extends RequestRealestateState {
  final String message;
  RequestRealestateError(this.message);
}
