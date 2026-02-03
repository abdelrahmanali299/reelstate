import 'package:get_it/get_it.dart';
import 'package:reelstate/core/services/fire_store_service.dart';
import 'package:reelstate/features/home/data/repos/home_repo.dart';
import 'package:reelstate/features/home/data/repos/home_repo_impl.dart';

class GetItService {
  static late GetIt getIt;

  static void init() {
    getIt = GetIt.instance;

    getIt.registerSingleton<FireStoreService>(FireStoreService());

    getIt.registerSingleton<HomeRepo>(
      HomeRepoImpl(fireStoreService: getIt<FireStoreService>()),
    );
  }
}
