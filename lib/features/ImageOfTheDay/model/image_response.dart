

import 'package:asteroid_test_app/features/ImageOfTheDay/model/image_of_the_day.dart';

class ImageResponse {
  ImageResponse(this.imotdRes);

  final List<ImageOfTheDayModel> imotdRes;

  factory ImageResponse.fromJson(List<dynamic> json) {
    var imotdRes = <ImageOfTheDayModel>[];
    for (var item in json) {
      imotdRes.add(ImageOfTheDayModel.fromJson(item));
    }

    return ImageResponse(imotdRes);
  }

  @override
  String toString() {
    return 'Image Response: $imotdRes';
  }
}