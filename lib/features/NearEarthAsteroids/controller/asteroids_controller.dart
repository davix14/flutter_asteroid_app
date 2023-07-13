import 'package:asteroid_test_app/features/NearEarthAsteroids/models/nea_model.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/service/nea_service.dart';
import 'package:asteroid_test_app/util/helpers.dart';
import 'package:asteroid_test_app/util/local_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asteroidsControllerProvider = StateNotifierProvider.autoDispose<
    AsteroidsController,
    AsyncValue<NeaModel>>((ref) => AsteroidsController(ref));

class AsteroidsController extends StateNotifier<AsyncValue<NeaModel>> {
  AsteroidsController(this._ref) : super(const AsyncValue.loading()) {
    getAsteroids();
  }

  final Ref _ref;
  NeaModel? latestAsteroids;

  NeaService get _neaService => _ref.read(neaServiceProvider);
  String lastDate = getFormattedDate(DateTime.now());

  void getAsteroids({DateTime? dateIn}) async {
    state = const AsyncLoading();
    lastDate = dateIn != null
        ? lastDate = getFormattedDate(dateIn)
        : _ref.read(localStorageProvider).lastDateUsed;
    if (lastDate == '') lastDate = getFormattedDate(DateTime.now());
    try {
      latestAsteroids = await _neaService.getNea(lastDate);
      state = AsyncValue.data(latestAsteroids!);
    } catch (e, stacktrace) {
      print('error getting asteroids: $stacktrace');
      state = AsyncValue.error(e, stacktrace);
    }
  }
}
