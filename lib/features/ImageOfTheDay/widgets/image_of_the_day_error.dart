import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../../theme/theme_constants.dart';

@Preview(name: 'ImageOfTheDayError')
Widget imageOfTheDayErrorPreview() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: ImageOfTheDayError(
          'Failed to load NASA APOD: 500 Internal Server Error',
          StackTrace.empty,
          () {},
        ),
      ),
    ),
  );
}

class ImageOfTheDayError extends StatelessWidget {
  const ImageOfTheDayError(
    this._error,
    this._stacktrace,
    this._retry, {
    super.key,
  });

  final Object _error;
  final StackTrace _stacktrace;
  final VoidCallback _retry;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error getting image or other:'),
          vGap8,
          // Text(_error.toString()),
          vGap8,
          FilledButton.icon(
            onPressed: _retry,
            label: Text('Retry'),
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    );
  }
}
