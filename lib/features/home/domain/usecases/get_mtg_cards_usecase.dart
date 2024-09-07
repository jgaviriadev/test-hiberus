import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/card_entity.dart';
import '../repositories/home_repository.dart';

class GetMTGCardsUseCase implements UseCase<GetMTGCardsUseCaseResult, NoParams> {
  final HomeRepository repository;
  GetMTGCardsUseCase({required this.repository});

  @override
  Future<Either<Failure, GetMTGCardsUseCaseResult>> call(NoParams params) async {
    final result = await repository.getMTGCards();
    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(
        GetMTGCardsUseCaseResult(result: resp.result),
      ),
    );
  }
}

class GetMTGCardsUseCaseResult {
  final List<CardEntity> result;
  const GetMTGCardsUseCaseResult({required this.result});
}
