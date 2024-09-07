import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../usecases/usecases.dart';

abstract class HomeRepository {
  Future<Either<Failure, GetMTGCardsUseCaseResult>> getMTGCards();
}
