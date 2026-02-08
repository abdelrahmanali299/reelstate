import 'package:dartz/dartz.dart';
import 'package:reelstate/core/fire_store_collections.dart';
import 'package:reelstate/core/services/fire_store_service.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final FireStoreService fireStoreService;

  HomeRepoImpl({required this.fireStoreService});
  @override
  Future<Either<String, List<RealestateModel>>> getAllRealestates() async {
    try {
      var result = await fireStoreService.getDataList(
        path: FireStoreCollections.realestateCollection,
      );
      return Right(
        result.map((item) => RealestateModel.fromJson(item)).toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RealestateModel>>> getEgarRealestates() async {
    try {
      var result = await fireStoreService.getDataList(
        query: {"where": "type", "value": RealestateType.egar.name},
        path: FireStoreCollections.realestateCollection,
      );
      return Right(
        result.map((item) => RealestateModel.fromJson(item)).toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RealestateModel>>> getTamleekRealestates() async {
    try {
      var result = await fireStoreService.getDataList(
        query: {"where": "type", "value": RealestateType.tamleek.name},

        path: FireStoreCollections.realestateCollection,
      );
      return Right(
        result.map((item) => RealestateModel.fromJson(item)).toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
