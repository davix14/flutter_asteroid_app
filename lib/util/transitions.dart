import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

 makeSlideTransitionPageRoute({
  required Widget child,
  transitionDuration = const Duration(milliseconds: 500),
}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation,
        secondaryAnimation) =>
    child,
    transitionsBuilder: (_, a1, a2, child) =>
        SlideTransition(
          position: a1.drive(_offsetTween),
          child: child,
        )
    ,
  );
}

final _offsetTween = Tween(
  begin: const Offset(1, 0),
  end: Offset.zero,
).chain(CurveTween(curve: Curves.ease));
