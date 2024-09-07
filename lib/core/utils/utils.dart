import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_hiberus_jg/core/utils/constants.dart';

class AppUtils {
  AppUtils._(); 

  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static String removeBraces(String input) {
    return input.replaceAll("{", "").replaceAll("}", "");
  }

  static String getMessageError (String message, AppLocalizations l10n){
    String userMessage = '';
    switch (message) {
      case Constants.errorcodeConection:
        userMessage = l10n.noInternet;
        break;

      case Constants.errorcodeServer:
        userMessage = l10n.serverError;
        break;

      default:
        userMessage =  message.isNotEmpty ? message : l10n.genericError;
    }
    return userMessage;
  }
}