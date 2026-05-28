import 'package:asteroid_test_app/features/NearEarthAsteroids/models/nea_model.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/service/nea_service.dart';
import 'package:asteroid_test_app/util/helpers.dart';
import 'package:asteroid_test_app/util/local_storage_repository.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';

final asteroidsControllerProvider = AsyncNotifierProvider.autoDispose<
        AsteroidsController, Map<String, List<SingleAsteroid>>>(
    AsteroidsController.new);

class AsteroidsController
    extends AsyncNotifier<Map<String, List<SingleAsteroid>>> {
  
  NeaModel? latestAsteroids;
  late DateTimeRange lastDate;

  NeaService get _neaService => ref.read(neaServiceProvider);

  @override
  FutureOr<Map<String, List<SingleAsteroid>>> build() async {
    return _fetchAsteroids();
  }

  Future<Map<String, List<SingleAsteroid>>> _fetchAsteroids({DateTimeRange? dateRangeIn}) async {
    if (ref.read(localStorageProvider).lastStartDateUsed == '') {
      lastDate = DateTimeRange(
          start: Jiffy.now().subtract(days: 7).dateTime, end: DateTime.now());
    } else {
      lastDate = dateRangeIn ??
          DateTimeRange(
              start: DateTime.parse(
                  ref.read(localStorageProvider).lastStartDateUsed),
              end: DateTime.parse(
                  ref.read(localStorageProvider).lastEndDateUsed));
    }
    latestAsteroids = await _neaService.getNea(lastDate);
    return _sortLatestAsteroids();
  }

  void getAsteroids({DateTimeRange? dateRangeIn}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchAsteroids(dateRangeIn: dateRangeIn));
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
