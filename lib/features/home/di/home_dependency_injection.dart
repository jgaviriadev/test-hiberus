import '../../../injection_container.dart';
import '../data/datasources/home_datasource.dart';
import '../data/datasources/home_datasource_imp.dart';
import '../data/repositories/home_repository_imp.dart';
import '../domain/repositories/home_repository.dart';
import '../domain/usecases/usecases.dart';
import '../presentation/bloc/home_bloc.dart';

Future<void> initHomeInjectDependencies() async {
  //bloc
  getIt.registerFactory(() => HomeBloc(
    getMTGCardsUseCase: getIt(),
  ));

  //UseCases
  getIt.registerLazySingleton(() => GetMTGCardsUseCase(repository: getIt()));

  //Home Repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeDatasource: getIt()),
  );

  //Datasource
  getIt.registerLazySingleton<HomeDatasource>(
    () => HomeDatasourceImpl(
      apiClient: getIt(),
    ),
  );
}
