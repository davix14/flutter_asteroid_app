
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
  static const _lastStartDateUsedKey = 'lastStartDateUsed';
  static const _lastEndDateUsedKey = 'lastEndDateUsed';
  static const _lastAsteroidResponseKey = 'lastAsteroidResponse';
  static const _lastImageOfTheDayResponseKey = 'lastIMODResponse';

  set lastStartDateUsed(String lastDateUsed) => _prefs.setString(_lastStartDateUsedKey, lastDateUsed);
  String get lastStartDateUsed => _prefs.getString(_lastStartDateUsedKey) ?? '';

  set lastEndDateUsed(String lastDateUsed) => _prefs.setString(_lastEndDateUsedKey, lastDateUsed);
  String get lastEndDateUsed => _prefs.getString(_lastEndDateUsedKey) ?? '';

  set lastAsteroidResponse(String lastResponse) => _prefs.setString(_lastAsteroidResponseKey, lastResponse);
  String get lastAsteroidResponse => _prefs.getString(_lastAsteroidResponseKey) ?? '';

  set lastImageOfTheDayResponse(String lastResponse) => _prefs.setString(_lastImageOfTheDayResponseKey, lastResponse);
  String get lastImageOfTheDayResponse => _prefs.getString(_lastImageOfTheDayResponseKey) ?? '';
}

