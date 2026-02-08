part of 'request_realestate_cubit.dart';

@immutable
abstract class RequestRealestateState {}

class RequestRealestateInitial extends RequestRealestateState {}

class RequestRealestateLoading extends RequestRealestateState {}

class RequestRealestateSuccess extends RequestRealestateState {
  RequestRealestateSuccess();
}

class RequestRealestateError extends RequestRealestateState {
  final String message;
  RequestRealestateError(this.message);
}
