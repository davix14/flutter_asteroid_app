import 'dart:typed_data';

import 'package:asteroid_test_app/features/ImageOfTheDay/model/image_of_the_day.dart';
import 'package:asteroid_test_app/features/ImageOfTheDay/services/download_image_service.dart';
import 'package:asteroid_test_app/util/asteroid_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';

import '../../../theme/theme_constants.dart';

class FullscreenImageWidget extends StatefulWidget {
  const FullscreenImageWidget(
      {super.key, required this.imageOfDay, required this.imgBytes});

  final ImageOfTheDayModel imageOfDay;
  final Uint8List imgBytes;

  @override
  _FullscreenImageState createState() => _FullscreenImageState();
}

class _FullscreenImageState extends State<FullscreenImageWidget> {
  ///If the box is expanded
  bool _isExpanded = true;

  ///Toogle the box to expand or collapse
  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            PhotoView(
              imageProvider: Image.memory(
                widget.imgBytes,
                height: context.mediaSize.height * .8,
                width: context.mediaSize.width,
              ).image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: context.mediaSize.height * .10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_double_arrow_left),
                        color: Colors.white,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: context.mediaSize.height * .10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return IconButton(
                            icon: const Icon(Icons.download),
                            color: Colors.white,
                            onPressed: () async {
                              final result = await ref
                                  .read(downloadImageServiceProvider)
                                  .saveImageOfTheDay(widget.imgBytes);
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    backgroundColor: Theme.of(context).primaryColor,
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
                                        Text(result
                                            ? 'Saved image successfully'
                                            : 'Error saving image'),
                                      ],
                                    ),
                                  ),
                                );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn,
                  height: _isExpanded
                      ? context.mediaSize.height * .66
                      : context.mediaSize.height * .9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(p8),
                        child: IconButton(
                            onPressed: _toogleExpand,
                            icon: Icon(
                              _isExpanded
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              color: Colors.white70,
                            ))),
                    hGap10,
                    Text(
                      widget.imageOfDay.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),
                    ),
                  ],
                ),
                Flexible(
                  child: SizedBox(
                    height: _isExpanded
                        ? context.mediaSize.height * .25
                        : context.mediaSize.height * 0,
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
                                if (_isExpanded)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: p8),
                                    child: Text(
                                      widget.imageOfDay.explanation,
                                      style: const TextStyle(
                                          color: Colors.white70),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
