import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../theme/theme_constants.dart';
import '../../../../util/asteroid_context_ext.dart';

@Preview(name: 'ExplanationWidget')
Widget explanationWidgetPreview() {
  // Repeated paragraphs make the text exceed the max height so the
  // scroll cap can be verified.
  final longHtml = List.generate(
    6,
    (i) =>
        '<p>Paragraph ${i + 1}: A <b>spiral galaxy</b> is shown in front of a '
        'dark field of stars. See <a href="https://nasa.gov">NASA</a> for more.</p>',
  ).join();

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
          child: ExplanationWidget(
            title: 'M83: The Southern Pinwheel',
            explanation: longHtml,
          ),
        ),
      ),
    ),
  );
}

class ExplanationWidget extends StatefulWidget {
  const ExplanationWidget({
    super.key,
    required this.title,
    required this.explanation,
  });

  final String title;
  final String explanation;

  @override
  State<ExplanationWidget> createState() => _ExplanationWidgetState();
}

class _ExplanationWidgetState extends State<ExplanationWidget> {
  ///If the box is expanded
  bool _isExpanded = true;

  ///Toggle the box to expand or collapse
  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Icon
              Padding(
                padding: const EdgeInsets.all(p8),
                child: IconButton(
                  onPressed: _toggleExpand,
                  icon: Icon(
                    _isExpanded ? Icons.arrow_downward : Icons.arrow_upward,
                    color: Colors.white70,
                  ),
                ),
              ),
              hGap10,
              // Title
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            alignment: Alignment.topCenter,
            child: _isExpanded
                ? ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: context.mediaSize.height * .3,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: p15),
                      child: SingleChildScrollView(
                        child: HtmlWidget(
                          widget.explanation,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
