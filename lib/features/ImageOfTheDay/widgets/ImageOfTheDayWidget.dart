import 'package:asteroid_test_app/features/ImageOfTheDay/widgets/FullscreenImageWidget.dart';
import 'package:asteroid_test_app/features/ImageOfTheDay/widgets/image_of_the_day_error.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:asteroid_test_app/util/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/animations/loading_shimmer.dart';
import '../../../theme/theme_constants.dart';
import '../services/ImageOfTheDayService.dart';
import '../model/image_of_the_day.dart';

class ImageOfTheDayWidget extends ConsumerWidget {
  const ImageOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ImageOfTheDayModel> latestImageFuture = ref.watch(
      latestImageOfTheDayFutureProvider,
    );

    return latestImageFuture.when(
      skipLoadingOnReload: false,
      data: (imageOfDay) {
        final imgBytes = ref.read(imageOfTheDayServiceProvider).imageBytes;
        final image2 = Image.memory(
          imgBytes,
          height: context.mediaSize.height * .3,
          width: context.mediaSize.width,
          fit: BoxFit.cover,
        );

        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: [
              image2,
              // Top Title
              Positioned(
                top: 8,
                left: 8,
                right: 8,
                child: Text(
                  imageOfDay.title,
                  style: const TextStyle(color: Colors.white, fontSize: tx19),
                ),
              ),
              // Fullscreen button
              Positioned(
                bottom: 4,
                left: 4,
                child: IconButton(
                  icon: const Icon(
                    Icons.fullscreen_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    makeSlideTransitionPageRoute(
                      child: FullscreenImageWidget(
                        imageOfDay: imageOfDay,
                        imgBytes: imgBytes,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return ImageOfTheDayError(error, stackTrace, () => ref.refresh(latestImageOfTheDayFutureProvider));
      },
      loading: () => SizedBox(
        height: context.mediaSize.height * .3,
        width: context.mediaSize.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: const LoadingShimmer(
            cycle: Duration(seconds: 1),
            colors: <Color>[
              Colors.white,
              Colors.grey,
              Colors.white,
              Colors.grey,
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }
}
