import 'dart:convert';

import 'package:test_hiberus_jg/features/home/data/models/card_model.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/services/mtg_api_client.dart';
import 'home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource {
  final MTGApiClient apiClient;
  HomeDatasourceImpl({required this.apiClient});

  @override
  Future<List<CardModel>> getMTGCards() async {
    try {
      final result = await apiClient.get(endpoint: "/cards");
      if (result.statusCode == 200) {
        var response = json.decode(result.body);
        var cardsList = response['cards'] as List;
        return cardsList.map((e) => CardModel.fromMap(e)).toList();
      } else {
        throw ServerException(message: 'Failed to load cards: ${result.statusCode}');
      }
    } catch (e) {
      if (e is ServerException || e is ConnectionException) {
        rethrow; // Rethrow the exception for the repository to handle
      } else {
        throw ServerException(message: 'An error has occurred: $e');
      }
    }
  }
}
