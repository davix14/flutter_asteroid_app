import 'dart:typed_data';

import 'package:asteroid_test_app/features/ImageOfTheDay/services/download_image_service.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

import 'fullscreen_iotd/explanation_widget.dart';

class FullscreenImageWidget extends StatelessWidget {
  const FullscreenImageWidget({
    super.key,
    required this.title,
    required this.explanation,
    required this.imgBytes,
  });

  final String title;
  final String explanation;
  final Uint8List imgBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            PhotoView(
              imageProvider: Image.memory(
                imgBytes,
                height: context.mediaSize.height * .8,
                width: context.mediaSize.width,
              ).image,
            ),
            // back button
            Positioned(
              top: 0,
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: const Icon(Icons.keyboard_double_arrow_left),
                    color: Colors.white,
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
            ),
            // download icon
            Positioned(
              top: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                          return IconButton(
                            icon: const Icon(Icons.download),
                            color: Colors.white,
                            onPressed: () async {
                              final result = await ref
                                  .read(downloadImageServiceProvider)
                                  .saveImageOfTheDay(imgBytes);
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).primaryColor,
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          result
                                              ? Icons.info_outline
                                              : Icons.phonelink_erase_rounded,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          result
                                              ? 'Saved image successfully'
                                              : 'Error saving image',
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                            },
                          );
                        },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              right: 10,
              child: ExplanationWidget(title: title, explanation: explanation),
            ),
          ],
        ),
      ),
    );
  }
}
