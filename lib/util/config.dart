import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  /// NASA API key loaded from the local .env file.
  static String get nasaApiKey => dotenv.env['NASA_API_KEY'] ?? '';

  static void validate() {
    if (nasaApiKey.isEmpty) {
      throw AssertionError(
        'NASA_API_KEY is not defined in your local .env file.\n'
        'Please ensure you have a .env file at the project root containing:\n'
        'NASA_API_KEY=your_key'
      );
    }
  }
}
