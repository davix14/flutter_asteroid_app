import 'package:asteroid_test_app/features/NearEarthAsteroids/models/nea_model.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/service/nea_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asteroidsControllerProvider =
    StateNotifierProvider.autoDispose<AsteroidsController, AsyncValue<NeaModel>>((ref) => AsteroidsController(ref));

class AsteroidsController extends StateNotifier<AsyncValue<NeaModel>> {

  AsteroidsController(
      this.ref
      ) : super(const AsyncValue.loading()){
    getAsteroids();
  }
  final Ref ref;
  NeaModel? latestAsteroids;
  NeaService get _neaService => ref.read(neaServiceProvider);

  void getAsteroids() async {
    try {
      latestAsteroids = await _neaService.getNea();
      state =  AsyncValue.data(latestAsteroids!);
    } catch (e, stacktrace) {
      print('error getting asteroids: $stacktrace');
      state = AsyncValue.error(e, stacktrace);
    }
  }
}