
import 'package:asteroid_test_app/features/NearEarthAsteroids/models/links_model.dart';

class NeaModel {
  NeaModel(
    this.asteroidList,
    this.links,
  );

  final Map<String, List<SingleAsteroid>> asteroidList;
  final LinksModel links;

  factory NeaModel.fromJson(Map<String, dynamic> json) {
    final nearEarthAsteroids = json['near_earth_objects'] as Map<String, dynamic>;

    MapEntry<String, List<SingleAsteroid>> makeEntry(String key, dynamic value){
        final asteroidList = value as List<dynamic>;
        final completeAsteroidList = asteroidList.map((e) => SingleAsteroid.fromJson(e)).toList();

      return MapEntry(key, completeAsteroidList);
    }

    return NeaModel(
      nearEarthAsteroids.map(makeEntry),
      LinksModel.fromJson(json['links']),
    );
  }

  @override
  String toString() {
    return 'NeaModel{asteroidList: $asteroidList, links: $links}';
  }
}

class SingleAsteroid {
  SingleAsteroid(
    this.id,
    this.name,
    this.estimatedDiameterKilometersMin,
    this.estimatedDiameterKilometersMax,
    this.estimatedDiameterMilesMin,
    this.estimatedDiameterMilesMax,
    this.isPotentiallyHazardous,
    this.closeApproachDate,
    this.missDistanceKilometers,
    this.missDistanceMiles,
    this.relativeVelocityKPH,
    this.relativeVelocityMPH,
    this.orbitingBody,
  );

  final String id;
    final String name;
    final double estimatedDiameterKilometersMin;
    final double estimatedDiameterKilometersMax;
    final double estimatedDiameterMilesMin;
    final double estimatedDiameterMilesMax;
    final bool isPotentiallyHazardous;
    final String closeApproachDate;
    final double missDistanceKilometers;
    final double missDistanceMiles;
    final double relativeVelocityKPH;
    final double relativeVelocityMPH;
    final String orbitingBody;

  factory SingleAsteroid.fromJson(Map<String, dynamic> json){
      return SingleAsteroid(
          json['id'],
          json['name'],
          json['estimated_diameter']['kilometers']['estimated_diameter_min'],
          json['estimated_diameter']['kilometers']['estimated_diameter_max'],
          json['estimated_diameter']['miles']['estimated_diameter_min'],
          json['estimated_diameter']['miles']['estimated_diameter_max'],
          json['isPotentiallyHazardous'] ?? false,
          json['close_approach_data'][0]['close_approach_date'],
          double.parse(json['close_approach_data'][0]['miss_distance']['kilometers']),
          double.parse(json['close_approach_data'][0]['miss_distance']['miles']),
          double.parse(json['close_approach_data'][0]['relative_velocity']['kilometers_per_hour']),
        double.parse(json['close_approach_data'][0]['relative_velocity']['miles_per_hour']),
          json['close_approach_data'][0]['orbiting_body'],
      );
  }

  @override
  String toString() {
    return 'SingleAsteroid{id: $id, name: $name, estimatedDiameterKilometersMin: $estimatedDiameterKilometersMin, estimatedDiameterKilometersMax: $estimatedDiameterKilometersMax, estimatedDiameterMilesMin: $estimatedDiameterMilesMin, estimatedDiameterMilesMax: $estimatedDiameterMilesMax, isPotentiallyHazardous: $isPotentiallyHazardous, closeApproachDate: $closeApproachDate, missDistanceKilometers: $missDistanceKilometers, missDistanceMiles: $missDistanceMiles, relativeVelocityKPH: $relativeVelocityKPH, relativeVelocityMPH: $relativeVelocityMPH, orbitingBody: $orbitingBody}';
  }
}
// NEA single asteroid raw response
/*
"links": {
                    "self": "http://api.nasa.gov/neo/rest/v1/neo/2267223?api_key=2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn"
                },
                "id": "2267223",
                "neo_reference_id": "2267223",
                "name": "267223 (2001 DQ8)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2267223",
                "absolute_magnitude_h": 18.18,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.6145468212,
                        "estimated_diameter_max": 1.3741684676
                    },
                    "meters": {
                        "estimated_diameter_min": 614.5468212287,
                        "estimated_diameter_max": 1374.1684676237
                    },
                    "miles": {
                        "estimated_diameter_min": 0.3818615729,
                        "estimated_diameter_max": 0.8538684349
                    },
                    "feet": {
                        "estimated_diameter_min": 2016.2297929599,
                        "estimated_diameter_max": 4508.4268753186
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2021-01-22",
                        "close_approach_date_full": "2021-Jan-22 16:21",
                        "epoch_date_close_approach": 1611332460000,
                        "relative_velocity": {
                            "kilometers_per_second": "25.0536414001",
                            "kilometers_per_hour": "90193.1090403452",
                            "miles_per_hour": "56042.4904478745"
                        },
                        "miss_distance": {
                            "astronomical": "0.3401654918",
                            "lunar": "132.3243763102",
                            "kilometers": "50888033.020782466",
                            "miles": "31620357.4636553908"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
 */
