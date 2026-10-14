import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage makeSlideTransitionPage({
  required LocalKey key,
  required Widget child,
  Duration duration = const Duration(milliseconds: 500),
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (_, a1, a2, child) =>
        SlideTransition(
          position: a1.drive(_offsetTween),
          child: child,
        ),
  );
}

final _offsetTween = Tween(
  begin: const Offset(1, 0),
  end: Offset.zero,
).chain(CurveTween(curve: Curves.ease));
