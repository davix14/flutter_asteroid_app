import 'dart:io';

import 'package:asteroid_test_app/util/helpers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final downloadImageServiceProvider =
    Provider.autoDispose<DownloadImageService>((ref) {
  return const DownloadImageService();
});

class DownloadImageService {
  const DownloadImageService();

  Future<bool> saveImageOfTheDay(Uint8List? bytes) async {
    bool result = false;
    final fileName = 'ImageOfTheDay ${DateTime.now().getFormattedDate()}.jpg';

    if (bytes == null) {
      print('data is null');
      return result;
    }
    try {
      if (Platform.isAndroid) {
        const platform = MethodChannel('com.asteroidApp.dev/save');
        final androidResult = await platform.invokeMethod(
          'saveFile',
          {
            'fileName': fileName,
            'mimeType': 'image/jpeg',
            'bytes': bytes,
          },
        );
        if (androidResult.runtimeType == String) {
          result = true;
          print('File Saved Successfully!');
        }
        return result;
      } else {
        final dir = await getApplicationDocumentsDirectory();
        final file = File(
            '${dir.path}/ImageOfTheDay ${DateTime.now().getFormattedDate()}.jpg');
        if (await file.exists()) {
          print('File Already exists');
          return result;
        }
        file.writeAsBytesSync(bytes);
        print('File Saved Successfully!');
        result = true;
      }
    } on Exception catch (e) {
      print('Error writing file! $e');
    }
    return result;
  }
}
