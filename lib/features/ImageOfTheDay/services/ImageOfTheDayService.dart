import 'dart:convert';
import 'dart:typed_data';

import 'package:asteroid_test_app/features/ImageOfTheDay/model/ImageOfTheDayModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


class ImageOfTheDayService {
  late ImageOfTheDayModel latestResponse;
  late Uint8List imageBytes;

  Future<ImageOfTheDayModel> getImageOfTheDay() async {
    final url = Uri.https('api.nasa.gov', '/planetary/apod',
        {'api_key': '2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn'});
    final response = await http.get(url);
    print(response.toString());
    latestResponse = ImageOfTheDayModel.fromJson(jsonDecode(response.body));
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
