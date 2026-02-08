import 'package:dartz/dartz.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<RealestateModel>>> getRealestates({
    required RealestateType? type,
  });

  Future<Either<String, List<RealestateModel>>> getRealestatesOrderByPrice({
    required bool descending,
    required RealestateType? type,
  });
  Future<Either<String, List<RealestateModel>>> getRealestatesOrderByArea({
    required bool descending,
    required RealestateType? type,
  });
  Future<Either<String, List<RealestateModel>>> getRealestatesOrderByAddress();
}
