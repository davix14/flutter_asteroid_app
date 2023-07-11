import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nea_model.dart';

final neaServiceProvider = Provider.autoDispose((ref) => NeaService());

class NeaService {
  
  final dio = Dio();
  
  Future<NeaModel> getNea() async{
    final response = await dio.get('https://api.nasa.gov/neo/rest/v1/feed?start_date=2023-03-13&end_date=2023-03-20&api_key=2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn');
    print(response);
    final neaModel = NeaModel.fromJson(response.data);
    // final single = neaModel.asteroidList.entries.first.value.first;
    print(neaModel.asteroidList.entries.first.key);
    return neaModel;
  }

}
/// Useful pretty printer for printing [JSON]
String prettyPrintJson(Object? obj) => const JsonEncoder.withIndent(' ').convert(obj);

// Raw Response
/*
{
    "links": {
        "next": "http://api.nasa.gov/neo/rest/v1/feed?start_date=2021-01-22&end_date=2021-01-29&detailed=false&api_key=2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn",
        "previous": "http://api.nasa.gov/neo/rest/v1/feed?start_date=2021-01-08&end_date=2021-01-15&detailed=false&api_key=2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn",
        "self": "http://api.nasa.gov/neo/rest/v1/feed?start_date=2021-01-15&end_date=2021-01-22&detailed=false&api_key=2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn"
    },
    "element_count": 150,
    "near_earth_objects": {
        "2021-01-22": [
            {
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
            },
        ]
    }
}
 */