import 'package:get_it/get_it.dart';

import 'core/services/mtg_api_client.dart';
import 'features/home/di/home_dependency_injection.dart';



final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  await initHomeInjectDependencies();

  //Server Api Client to Http consume rest apis - MTG
  getIt.registerLazySingleton(
    () => MTGApiClient(),
  );
 

  //external
  //getIt.registerLazySingleton(() => Connectivity());
}
