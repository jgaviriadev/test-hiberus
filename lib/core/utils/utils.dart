class AppUtils {
  AppUtils._(); 

  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static String removeBraces(String input) {
    return input.replaceAll("{", "").replaceAll("}", "");
  }
}