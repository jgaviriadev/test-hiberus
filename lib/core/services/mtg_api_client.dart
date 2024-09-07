import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:test_hiberus_jg/core/network/exception.dart';
import '../../injection_container.dart';

class MTGApiClient {
  MTGApiClient();
  
  final String baseUrl = "api.magicthegathering.io";
  
  /// Generic method for make requests to the MTG API
  Future<http.Response> get({
    required String endpoint,
    Map<String, String>? queryParams,
  }) async {
    
    /// build the URL with the optional parameters
    final uri = Uri.https(baseUrl, '/v1$endpoint', queryParams);
    
    try {
      // Check Internet connection
      final bool hasConnection = await InternetConnectionChecker().hasConnection.timeout(
        const Duration(seconds: 5),
        onTimeout: () => false,
      );
      if (hasConnection) {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
        
          if (kDebugMode) {
            log(jsonEncode(data));
          }
          
          return response;
        } else if (response.statusCode == 500) {
          throw ServerException(message: "serviceNotAvailableMessage");
        } else if (response.statusCode >= 400 && response.statusCode < 500) {
          throw ServerException(message: response.body);
        } else {
          throw ServerException(message: 'Unexpected error occurred: ${response.statusCode}');
        }
      } else {
        await getIt.popScope();
        throw ConnectionException(message: "noInternetMessage");
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  
  /// Obtener todas las cartas
  Future<http.Response> getAllCards({Map<String, String>? filters}) async {
    return get(endpoint: '/cards', queryParams: filters);
  }

  /// Obtener una carta por ID
  Future<http.Response> getCardById(String cardId) async {
    return get(endpoint: '/cards/$cardId');
  }
}
