import 'dart:convert';

import 'package:asteroid_test_app/features/ImageOfTheDay/model/ImageOfTheDayModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ImageOfTheDayService {

  Future<ImageOfTheDayModel> getImageOfTheDay() async{
    final url = Uri.https('api.nasa.gov', '/planetary/apod',
        {
          'api_key': '2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn'
        });
    final response = await http.get(url);
    print(response.toString());
    return ImageOfTheDayModel.fromJson(jsonDecode(response.body));
  }
}

final latestImageOfTheDayFutureProvider = FutureProvider.autoDispose<ImageOfTheDayModel>((ref) async {
  return ImageOfTheDayService().getImageOfTheDay();
});