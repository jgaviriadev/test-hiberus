import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/failure.dart';

import '../../domain/entities/card_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/usecases.dart';
import '../datasources/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl(
      {required this.homeDatasource});

  @override
  Future<Either<Failure, GetMTGCardsUseCaseResult>> getMTGCards() async{
    try {
      final result = await homeDatasource.getMTGCards();
      return Right(
        GetMTGCardsUseCaseResult( 
          result: result.map((model) => CardEntity.modelToEntity(model)).toList()
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ConnectionException  catch (e) {
      return Left(ConnectionFailure(message: e.message));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }
}
