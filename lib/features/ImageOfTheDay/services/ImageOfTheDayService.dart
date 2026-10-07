import 'dart:convert';
import 'dart:typed_data';

import 'package:asteroid_test_app/features/ImageOfTheDay/model/image_of_the_day.dart';
import 'package:asteroid_test_app/features/ImageOfTheDay/model/image_response.dart';
import 'package:asteroid_test_app/util/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ImageOfTheDayService {
  late ImageOfTheDayModel latestResponse;
  late Uint8List imageBytes;

  Future<ImageOfTheDayModel> getImageOfTheDay() async {
    // final url = Uri.https('api.nasa.gov', '/planetary/apod',
    //     {'api_key': AppConfig.nasaApiKey});

    final url = Uri.https('science.nasa.gov', '/wp-json/wp/v2/apod-basic',
        {'per_page': '1',
          'api_key': AppConfig.nasaApiKey} );
    print(url.toString());
    final response = await http.get(url);
    print(response.toString());
    final resJson = jsonDecode(response.body);
    final processedRes = ImageResponse.fromJson(resJson);
    latestResponse = processedRes.imotdRes.first;
    await getImageBytes();
    return latestResponse;
  }

  Future<Uint8List> getImageBytes() async {
    final response = await http.get(Uri.parse(latestResponse.hdurl));
    imageBytes = response.bodyBytes;
    return imageBytes;
  }
}

final imageOfTheDayServiceProvider = Provider<ImageOfTheDayService>((ref) {
  return ImageOfTheDayService();
});

final latestImageOfTheDayFutureProvider =
    FutureProvider<ImageOfTheDayModel>((ref) async {
  return ref.read(imageOfTheDayServiceProvider).getImageOfTheDay();
});
