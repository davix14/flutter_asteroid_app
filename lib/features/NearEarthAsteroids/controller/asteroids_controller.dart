import 'package:asteroid_test_app/features/NearEarthAsteroids/models/nea_model.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/service/nea_service.dart';
import 'package:asteroid_test_app/util/helpers.dart';
import 'package:asteroid_test_app/util/local_storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';

final asteroidsControllerProvider = StateNotifierProvider.autoDispose<
        AsteroidsController, AsyncValue<Map<String, List<SingleAsteroid>>>>(
    (ref) => AsteroidsController(ref));

class AsteroidsController
    extends StateNotifier<AsyncValue<Map<String, List<SingleAsteroid>>>> {
  AsteroidsController(this._ref) : super(const AsyncValue.loading()) {
    getAsteroids();
  }

  final Ref _ref;
  NeaModel? latestAsteroids;

  NeaService get _neaService => _ref.read(neaServiceProvider);
  late DateTimeRange lastDate;

  void getAsteroids({DateTimeRange? dateRangeIn}) async {
    state = const AsyncLoading();
    try {
      if (_ref.read(localStorageProvider).lastStartDateUsed == '') {
        lastDate = DateTimeRange(
            start: Jiffy.now().subtract(days: 7).dateTime, end: DateTime.now());
      } else {
        lastDate = dateRangeIn != null
            ? lastDate = dateRangeIn
            : DateTimeRange(
                start: DateTime.parse(
                    _ref.read(localStorageProvider).lastStartDateUsed),
                end: DateTime.parse(
                    _ref.read(localStorageProvider).lastEndDateUsed));
      }
      latestAsteroids = await _neaService.getNea(lastDate);
      state = AsyncValue.data(_sortLatestAsteroids());
    } catch (e, stacktrace) {
      print('error getting asteroids: $stacktrace');
      state = AsyncValue.error(e, stacktrace);
    }
  }

  Map<String, List<SingleAsteroid>> _sortLatestAsteroids() {
    Map<String, List<SingleAsteroid>> newMp = {};

    for (var i = 0; i < latestAsteroids!.asteroidList.entries.length; i++) {
      final date = Jiffy.parseFromDateTime(lastDate.start)
          .add(days: i)
          .dateTime
          .getFormattedDate();
      newMp.putIfAbsent(date, () => latestAsteroids!.asteroidList[date]!);
    }

    return newMp;
  }
}
