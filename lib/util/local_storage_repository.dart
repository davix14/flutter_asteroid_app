
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider<LocalStorageRepository>(
      (_) => throw UnimplementedError(),
);

class LocalStorageRepository {
  LocalStorageRepository(this._prefs);

  final SharedPreferences _prefs;

  static Future<LocalStorageRepository> createInstance() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return LocalStorageRepository(sharedPreferences);
  }

  // keys
  static const _lastDateUsedKey = 'lastDateUsed';
  static const _lastAsteroidResponseKey = 'lastAsteroidResponse';
  static const _lastImageOfTheDayResponseKey = 'lastIMODResponse';

  set lastDateUsed(String lastDateUsed) => _prefs.setString(_lastDateUsedKey, lastDateUsed);
  String get lastDateUsed => _prefs.getString(_lastDateUsedKey) ?? '';

  set lastAsteroidResponse(String lastResponse) => _prefs.setString(_lastAsteroidResponseKey, lastResponse);
  String get lastAsteroidResponse => _prefs.getString(_lastAsteroidResponseKey) ?? '';

  set lastImageOfTheDayResponse(String lastResponse) => _prefs.setString(_lastImageOfTheDayResponseKey, lastResponse);
  String get lastImageOfTheDayResponse => _prefs.getString(_lastImageOfTheDayResponseKey) ?? '';
}

