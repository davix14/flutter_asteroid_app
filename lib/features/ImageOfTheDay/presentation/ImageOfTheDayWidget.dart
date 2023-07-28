import 'package:asteroid_test_app/features/ImageOfTheDay/presentation/FullscreenImageWidget.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
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
          // alignment: Alignment.topCenter,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageOfDay.hdurl,
                height: context.mediaSize.height * .3,
                width: context.mediaSize.width,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: context.mediaSize.height * .3,
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
                            fontSize: tx19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.mediaSize.height * .19,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, top: 0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.fullscreen_outlined,
                        color: Colors.white,
                      ), onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FullscreenImageWidget(imageOfDay: imageOfDay)),
                    ),
                    ),
                  ),
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
