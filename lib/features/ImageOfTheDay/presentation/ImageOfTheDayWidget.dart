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
        return Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imageOfDay.hdurl,
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
                                  fontSize: p2,
                                ),
                              ),
                            ),
                          ),
                        ],
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