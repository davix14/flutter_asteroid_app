import 'dart:convert';
import 'dart:typed_data';

import 'package:asteroid_test_app/features/ImageOfTheDay/model/image_of_the_day.dart';
import 'package:asteroid_test_app/features/ImageOfTheDay/model/image_response.dart';
import 'package:asteroid_test_app/util/config.dart';
import 'package:asteroid_test_app/util/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ImageOfTheDayService {
  late ImageOfTheDayModel latestIMOTD;
  late List<ImageOfTheDayModel> imotdSearchResults;

  Future<ImageOfTheDayModel> getImageOfTheDay() async {
    final url = Uri.https('science.nasa.gov', '/wp-json/wp/v2/apod-basic', {
      'per_page': '1',
      'api_key': AppConfig.nasaApiKey,
    });
    final response = await http.get(url);
    final processedRes = ImageResponse.fromJson(jsonDecode(response.body));
    latestIMOTD = processedRes.imotdList.first;
    return latestIMOTD;
  }

  Future<List<ImageOfTheDayModel>> getImageOfTheDaySearchResults({
    required DateTimeRange dateRange,
  }) async {
    final url = Uri.https('science.nasa.gov', '/wp-json/wp/v2/apod-basic', {
      'start_date': dateRange.start.toPathParamDate(),
      'end_date': dateRange.end.toPathParamDate(),
      'per_page': '7',
      'api_key': AppConfig.nasaApiKey,
    });
    final response = await http.get(url);
    imotdSearchResults = ImageResponse.fromJson(
      jsonDecode(response.body),
    ).imotdList;
    return imotdSearchResults;
  }

  Future<Uint8List> getImageBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    return response.bodyBytes;
  }
}

final imageOfTheDayServiceProvider = Provider<ImageOfTheDayService>((ref) {
  return ImageOfTheDayService();
});

final latestImageOfTheDayFutureProvider = FutureProvider<ImageOfTheDayModel>((
  ref,
) async {
  return ref.read(imageOfTheDayServiceProvider).getImageOfTheDay();
});

final imageOfTheDaySearchResultsProvider =
    FutureProvider.family<List<ImageOfTheDayModel>, DateTimeRange>((
      ref,
      dateRange,
    ) async {
      return ref
          .read(imageOfTheDayServiceProvider)
          .getImageOfTheDaySearchResults(dateRange: dateRange);
    });

/*
* date using legacy YYMMDD format.
* Date Range Example URL
* https://science.nasa.gov/wp-json/wp/v2/apod-basic?date_from=140901&date_to=140930
* */
