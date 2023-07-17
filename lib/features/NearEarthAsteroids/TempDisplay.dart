import 'package:asteroid_test_app/features/NearEarthAsteroids/controller/asteroids_controller.dart';
import 'package:asteroid_test_app/single_asteroid_screen.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:asteroid_test_app/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';

class TempDisplay extends ConsumerStatefulWidget {
  @override
  TempDisplayState createState() => TempDisplayState();
}

class TempDisplayState extends ConsumerState<TempDisplay> {
  late final TextEditingController _dateCtrl;
  late final String lastStartDate;
  late final String lastEndDate;

  @override
  void initState() {
    super.initState();
    lastStartDate = ref.read(asteroidsControllerProvider.notifier).lastDate.start.getFormattedDate();
    lastEndDate = ref.read(asteroidsControllerProvider.notifier).lastDate.end.getFormattedDate();
    _dateCtrl = TextEditingController(text: '$lastStartDate to $lastEndDate');
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
                  width: context.mediaSize.width * .7,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextField(
                              maxLength: 11,
                              readOnly: true,
                              style: const TextStyle(fontSize: 14),
                              onTap: _changeDate,
                              // textAlign: TextAlign.center,
                              controller: _dateCtrl,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.edit_calendar_rounded),
                                  label: Text('Dates'),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                  counterText: ''),
                            ),
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
                      children:
                      allAsteroids!.map((e) => SizedBox(
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
                                    onTap: () => Navigator.of(context)
                                        .push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SingleAsteroidScreen(
                                                  data
                                                      .asteroidList
                                                      .entries
                                                      .first
                                                      .value
                                                      .first,
                                                ))),
                                    child:  Column(
                                      children: [
                                        Icon(e.isPotentiallyHazardous ? Icons.dangerous : Icons.health_and_safety_outlined),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )).toList(),
                    ),
                  ),
                ),
              ],
            );},
        error: (_, st) => Text('error! \n $st'),
        loading: () => const CircularProgressIndicator());
  }

  Future<void> _changeDate() async {
    final result = await showDateRangePicker(context: context, firstDate: Jiffy.now().subtract(days: 7).dateTime, lastDate: DateTime.now());

    /*showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(lastDate)!,
      firstDate: DateTime.tryParse('1960-01-01')!,
      lastDate: DateTime.now(),
    );*/
    if (result == null) return;
    print(result.end);
    _dateCtrl.text = '${result.end.getFormattedDate()} to ${result.start.getFormattedDate()}';
    ref.read(asteroidsControllerProvider.notifier).getAsteroids(dateRangeIn: result);
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
