import 'package:asteroid_test_app/features/NearEarthAsteroids/models/nea_model.dart';
import 'package:asteroid_test_app/theme/theme_constants.dart';
import 'package:flutter/material.dart';
// TODO: Add library for saving strings to central locations instead of hard-coded
class SingleAsteroidScreen extends StatelessWidget {
  const SingleAsteroidScreen(this._asteroidIn, {super.key});

  final SingleAsteroid _asteroidIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          style: const TextStyle(color: Colors.white),
          'Near Earth Object: ${_asteroidIn.name}',
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            _asteroidIn.isPotentiallyHazardous
                ? 'assets/images/asteroid_hazardous.png'
                : 'assets/images/asteroid_safe.png',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Name:',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(_asteroidIn.name,
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                        dividerH15T1,
                        // TODO: Add date icon to approach date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Close Approach Date:',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(_asteroidIn.closeApproachDate,
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                        dividerH15T1,
                        // TODO: make text bold and add a color dot for each planet
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Orbiting Body',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(_asteroidIn.orbitingBody,
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                        dividerH15T1,
                        // TODO: make text bold with a box green/red outline
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Potentially Hazrdous:',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(
                                    _asteroidIn.isPotentiallyHazardous
                                        .toString(),
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                        dividerH15T1,
                        // TODO: clip decimals to smaller amount
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Miss Distance (Miles):',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(
                                    '${_asteroidIn.missDistanceMiles} mi.',
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                        dividerH15T1,
                        // TODO: add speedometer icon if possible
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Relative Velocity MPH',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(
                                    '${_asteroidIn.relativeVelocityMPH} MPH',
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                        dividerH15T1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Min Estimated Diameter (Miles):',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(
                                    '${_asteroidIn.estimatedDiameterMilesMin} mi.',
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                        dividerH15T1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: Text(
                              'Max Estimated Diameter (Miles):',
                              style: TextStyle(
                                  fontSize: tx19, fontWeight: FontWeight.bold),
                            )),
                            Flexible(
                                child: Text(
                                    '${_asteroidIn.estimatedDiameterMilesMax} mi.',
                                    style: const TextStyle(fontSize: tx19))),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
