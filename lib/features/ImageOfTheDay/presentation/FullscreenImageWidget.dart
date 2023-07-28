import 'package:asteroid_test_app/features/ImageOfTheDay/model/ImageOfTheDayModel.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../theme/theme_constants.dart';

class FullscreenImageWidget extends StatefulWidget {
  const FullscreenImageWidget({super.key, required this.imageOfDay});

  final ImageOfTheDayModel imageOfDay;

  @override
  _FullscreenImageState createState() => _FullscreenImageState();
}

class _FullscreenImageState extends State<FullscreenImageWidget> {
  bool showInfo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            PhotoView(
              imageProvider: Image.network(
                widget.imageOfDay.hdurl,
                // imageOfDay.hdurl,
                height: context.mediaSize.height * .8,
                width: context.mediaSize.width,
                // fit: BoxFit.fitWidth,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    height: context.mediaSize.height,
                    width: context.mediaSize.width,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ).image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: context.mediaSize.height * .10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: IconButton(
                        icon: const Icon(Icons.exit_to_app_rounded),
                        color: Colors.white,
                        onPressed: () {
                          print(
                              'printing current visibility b4: ${showInfo.toString()}');
                          setState(() {
                            showInfo = !showInfo;
                          });;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
              visible: showInfo,
              child: Column(
                children: [
                  SizedBox(height: context.mediaSize.height * .66),
                  SizedBox(
                    height: context.mediaSize.height * .25,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(p8),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  widget.imageOfDay.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                                vGap8,
                                Text(
                                  widget.imageOfDay.explanation,
                                  style: const TextStyle(color: Colors.white70),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
