import 'package:asteroid_test_app/features/NearEarthAsteroids/controller/asteroids_controller.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(asteroidsControllerProvider);
    return controller.when(
      data: (data) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: context.mediaSize.width * .8,
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Current Date: ${data.asteroidList.entries.first.key}'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: data.asteroidList.entries.first.value
                    .map((e) => SizedBox(
                          width: double.infinity,
                          child: Card(
                            // color: ,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('id: ${e.name}'),
                                  Text('miss distance: ${e.missDistanceMiles}'),
                                  Text(
                                      'Is Hazardous ${e.isPotentiallyHazardous.toString()}'),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      error: (_, st) => Text('error! \n $st'),
      loading: () => Text('loading'),
    );
  }
}

/*
Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text('id: ${entry.name}'),
                            Text('Is Hazardous ${entry.isPotentiallyHazardous.toString()}'),
                          ],
                        ),
                      ),
                    )
 */
