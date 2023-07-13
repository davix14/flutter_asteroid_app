import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/theme_constants.dart';
import '../ImageOfTheDayService.dart';
import '../model/ImageOfTheDayModel.dart';

class ImageOfTheDayWidget extends ConsumerWidget {
  const ImageOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ImageOfTheDayModel> latestImageFuture =
        ref.watch(latestImageOfTheDayFutureProvider);
    return latestImageFuture.when(
      data: (imageOfDay) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageOfDay.hdurl,
                height: context.mediaSize.height * .33,
                width: context.mediaSize.width,
                fit: BoxFit.fitWidth,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 50,
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
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          imageOfDay.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: p1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.mediaSize.height * .23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.fullscreen_outlined,
                        color: Colors.white,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          barrierColor: Colors.black,
                          pageBuilder: (BuildContext context, _, __) {
                            return Scaffold(
                              body: Center(
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Image.network(
                                      imageOfDay.hdurl,
                                      height: context.mediaSize.height * .8,
                                      width: context.mediaSize.width,
                                      // fit: BoxFit.fitWidth,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return SizedBox(
                                          height: 50,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: context.mediaSize.height * .10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: GestureDetector(
                                          onTap: () => Navigator.of(context).pop(),
                                          child: const Icon(Icons.exit_to_app_rounded),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .10,
          width: double.infinity,
          child: const Center(
            child: Column(
              children: [
                Text('Error getting image or other'),
              ],
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class ImageFullScreenWrapperWidget extends StatelessWidget {
  final Image child;
  final bool dark;

  ImageFullScreenWrapperWidget({
    required this.child,
    this.dark = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            barrierColor: dark ? Colors.black : Colors.white,
            pageBuilder: (BuildContext context, _, __) {
              return Dialog.fullscreen(
                child: child,
              );
            },
          ),
        );
      },
      child: child,
    );
  }
}
