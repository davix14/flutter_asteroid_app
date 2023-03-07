import 'package:asteroid_test_app/features/ImageOfTheDay/model/ImageOfTheDayModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageOfTheDayService {
  final dio = Dio();

  Future<ImageOfTheDayModel> getImageOfTheDay() async{
    const picOfTheDayUrl = 'https://api.nasa.gov/planetary/apod?api_key=2JabBjC25TuPzOsfWYLBsxyzv6yIZmOT3WmDgIzn';
    final response = await dio.get(picOfTheDayUrl);
    print(response.toString());
    return ImageOfTheDayModel.fromJson(response.data);
  }
}

final latestImageOfTheDayFutureProvider = FutureProvider.autoDispose<ImageOfTheDayModel>((ref) async {
  return ImageOfTheDayService().getImageOfTheDay();
});