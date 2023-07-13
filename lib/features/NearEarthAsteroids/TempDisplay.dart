import 'package:asteroid_test_app/features/NearEarthAsteroids/controller/asteroids_controller.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:asteroid_test_app/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempDisplay extends ConsumerStatefulWidget {
  @override
  TempDisplayState createState() => TempDisplayState();
}

class TempDisplayState extends ConsumerState<TempDisplay> {

  late final TextEditingController _dateCtrl;
  late final String lastDate;

  @override
  void initState() {
    super.initState();
    lastDate = ref.read(asteroidsControllerProvider.notifier).lastDate;
    _dateCtrl = TextEditingController(text: lastDate);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(asteroidsControllerProvider);
    return controller.when(
        data: (data) => Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: context.mediaSize.width * .4,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                                suffixIcon: Icon(Icons.edit_calendar_rounded),
                                label: Text('Date'),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                                counterText: ''
                              ),
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
                      children: data.asteroidList.entries.first.value
                          .map((e) => SizedBox(
                                width: double.infinity,
                                child: Card(
                                  // color: ,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
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
        loading: () => const CircularProgressIndicator());
  }

  Future<void> _changeDate() async {
    final result = await showDatePicker(
        context: context,
        initialDate: DateTime.tryParse(lastDate)!,
        firstDate: DateTime.tryParse('1960-01-01')!,
        lastDate: DateTime.now(),
    );
    if (result == null) return;
    print(result);
    _dateCtrl.text = getFormattedDate(result);
    ref.read(asteroidsControllerProvider.notifier).getAsteroids(dateIn: result);
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
