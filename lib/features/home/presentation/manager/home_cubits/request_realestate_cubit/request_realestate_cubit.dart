import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';

part 'request_realestate_state.dart';

class RequestRealestateCubit extends Cubit<RequestRealestateState> {
  RequestRealestateCubit() : super(RequestRealestateInitial());
}
