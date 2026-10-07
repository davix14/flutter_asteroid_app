import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

@Preview()
Widget fancyContainerPreview() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LoadingShimmer(
          size: const Size(300, 200),
          cycle: const Duration(seconds: 1),
          colors: const <Color>[
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

class LoadingShimmer extends StatefulWidget {
  final Size? size;
  final Duration cycle;
  final List<Color> colors;

  const LoadingShimmer({
    super.key,
    this.size,
    required this.cycle,
    required this.colors,
  });

  @override
  State<LoadingShimmer> createState() => _FancyContainer();
}

class _FancyContainer extends State<LoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.cycle,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          width: widget.size?.width ?? double.infinity,
          height: widget.size?.height ?? double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.repeated,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: SlideGradient(controller.value),
              colors: widget.colors,
            ),
          ),
        );
      },
    );
  }
}

class SlideGradient implements GradientTransform {
  final double value;
  final double? offset;
  const SlideGradient(this.value, [this.offset]);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final calcOffset = offset ??
        (bounds.width > 0
            ? (bounds.height * bounds.height) / bounds.width
            : 0.0);
    final dist = value * (bounds.width + calcOffset);
    return Matrix4.identity()..translate(-dist);
  }
}
