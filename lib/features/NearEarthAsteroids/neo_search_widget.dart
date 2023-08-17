import 'package:asteroid_test_app/features/NearEarthAsteroids/controller/asteroids_controller.dart';
import 'package:asteroid_test_app/single_asteroid_screen.dart';
import 'package:asteroid_test_app/theme/theme_constants.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:asteroid_test_app/util/helpers.dart';
import 'package:asteroid_test_app/util/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';

class NEOSearchWidget extends ConsumerStatefulWidget {
  const NEOSearchWidget({super.key});

  @override
  NEOSearchState createState() => NEOSearchState();
}

class NEOSearchState extends ConsumerState<NEOSearchWidget> {
  late final TextEditingController _startDateCtrl;
  late final TextEditingController _endDateCtrl;
  late final String lastStartDate;
  late final String lastEndDate;
  late bool startDateSet;
  late bool endDateSet;

  @override
  void initState() {
    super.initState();
    lastStartDate = ref
        .read(asteroidsControllerProvider.notifier)
        .lastDate
        .start
        .getFormattedDate();
    lastEndDate = ref
        .read(asteroidsControllerProvider.notifier)
        .lastDate
        .end
        .getFormattedDate();
    _startDateCtrl = TextEditingController(text: lastStartDate);
    _endDateCtrl = TextEditingController(text: lastEndDate);
    startDateSet = false;
    endDateSet = false;
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(asteroidsControllerProvider);
    final notifier = ref.read(asteroidsControllerProvider.notifier);
    return controller.when(
        data: (data) {
          final allAsteroids = notifier.getAllAsteroids(data);
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: context.mediaSize.width * .9,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        hGap8,
                        Flexible(
                          child: TextField(
                            controller: _startDateCtrl,
                            onTap: _changeStartDate,
                            decoration:
                                const InputDecoration(labelText: 'Start Date'),
                            textAlign: TextAlign.center,
                            readOnly: true,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: p12),
                          child: Text('to'),
                        ),
                        Flexible(
                          child: TextField(
                            controller: _endDateCtrl,
                            onTap: _changeEndDate,
                            decoration:
                                const InputDecoration(labelText: 'End Date'),
                            textAlign: TextAlign.center,
                            readOnly: true,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            startDateSet = false;
                            endDateSet = false;
                            final startDate =
                                DateTime.parse(_startDateCtrl.text);
                            final endDate = DateTime.parse(_endDateCtrl.text);
                            final reversedOrder = startDate.isAfter(endDate);
                            ref
                                .read(asteroidsControllerProvider.notifier)
                                .getAsteroids(
                                    dateRangeIn: DateTimeRange(
                                  start: reversedOrder ? endDate : startDate,
                                  end: reversedOrder ? startDate : endDate,
                                ));
                          },
                          icon: const Icon(Icons.rocket_launch_outlined),
                        ),
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
                    children: allAsteroids!
                        .map((e) => SizedBox(
                              width: double.infinity,
                              child: Card(
                                // color: ,
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('id: ${e.name}'),
                                          Text(
                                              'miss distance: ${e.missDistanceMiles}'),
                                          Text(
                                              'Is Hazardous ${e.isPotentiallyHazardous.toString()}'),
                                        ],
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            makeSlideTransitionPageRoute(
                                              child: SingleAsteroidScreen(
                                                data.asteroidList.entries.first
                                                    .value.first,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(e.isPotentiallyHazardous
                                                  ? Icons.dangerous
                                                  : Icons
                                                      .health_and_safety_outlined),
                                            ],
                                          ),
                                        ),
                                      ),
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
          );
        },
        error: (_, st) => Text('error! \n $st'),
        loading: () => const CircularProgressIndicator());
  }

  Future<void> _changeStartDate() async {
    final startDateIsFirst = endDateSet != true;
    final endDate = DateTime.parse(_endDateCtrl.text);
    final result = await showDatePicker(
      context: context,
      initialDate: startDateIsFirst ? DateTime.parse(lastStartDate) : endDate,
      firstDate: startDateIsFirst
          ? DateTime.parse('1960-01-01')
          : Jiffy.parseFromDateTime(endDate).subtract(days: 7).dateTime,
      lastDate: startDateIsFirst
          ? DateTime.now()
          : Jiffy.parseFromDateTime(endDate).add(days: 7).dateTime,
    );
    if (result == null) return;
    startDateSet = true;
    _startDateCtrl.text = result.getFormattedDate();
  }

  Future<void> _changeEndDate() async {
    final endDateIsFirst = startDateSet != true;
    final startDate = DateTime.parse(_startDateCtrl.text);
    final result = await showDatePicker(
      context: context,
      initialDate: endDateIsFirst ? DateTime.parse(lastEndDate) : startDate,
      firstDate: endDateIsFirst
          ? DateTime.parse('1960-01-01')
          : Jiffy.parseFromDateTime(startDate).subtract(days: 7).dateTime,
      lastDate: endDateIsFirst
          ? DateTime.now()
          : Jiffy.parseFromDateTime(startDate).add(days: 7).dateTime,
    );
    if (result == null) return;
    if (endDateIsFirst) {
      endDateSet = true;
    }
    _endDateCtrl.text = result.getFormattedDate();
  }
}
