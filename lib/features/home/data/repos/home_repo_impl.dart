import 'package:dartz/dartz.dart';
import 'package:reelstate/core/fire_store_collections.dart';
import 'package:reelstate/core/services/fire_store_service.dart';
import 'package:reelstate/features/home/data/models/realestate_model.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final FireStoreService fireStoreService;

  HomeRepoImpl({required this.fireStoreService});

  @override
  Future<Either<String, List<RealestateModel>>> getRealestates({
    required RealestateType? type,
  }) async {
    try {
      var result = await fireStoreService.getDataList(
        query: {"where": "type", "value": type?.name},

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
  Future<Either<String, List<RealestateModel>>> getRealestatesOrderByPrice({
    required bool descending,
    required RealestateType? type,
  }) async {
    try {
      var result = await fireStoreService.getDataList(
        path: FireStoreCollections.realestateCollection,
        query: {
          "orderBy": "price",
          "descending": descending,
          "where": "type",
          "value": type?.name,
        },
      );
      return Right(
        result.map((item) => RealestateModel.fromJson(item)).toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<RealestateModel>>> getRealestatesOrderByAddress() {
    // TODO: implement getRealestatesOrderByAddress
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<RealestateModel>>> getRealestatesOrderByArea({
    required bool descending,
    required RealestateType? type,
  }) async {
    try {
      var result = await fireStoreService.getDataList(
        path: FireStoreCollections.realestateCollection,
        query: {
          "orderBy": "area",
          "descending": descending,
          "where": "type",
          "value": type?.name,
        },
      );
      return Right(
        result.map((item) => RealestateModel.fromJson(item)).toList(),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
