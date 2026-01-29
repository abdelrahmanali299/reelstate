import 'package:dartz/dartz.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<RealestateModel>>> getAllRealestates();
  Future<Either<String, List<RealestateModel>>> getTamleekRealestates();
  Future<Either<String, List<RealestateModel>>> getEgarRealestates();
}
