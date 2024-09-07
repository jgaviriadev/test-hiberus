

import '../models/card_model.dart';

abstract class HomeDatasource {
  Future<List<CardModel>> getMTGCards();
}
