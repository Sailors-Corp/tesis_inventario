class Utilities {
  static Future<String> eliminarComillas(String input) async {
    if (input.length >= 2 && input.startsWith('"') && input.endsWith('"')) {
      return input.substring(1, input.length - 1);
    } else {
      return input;
    }
  }
}
