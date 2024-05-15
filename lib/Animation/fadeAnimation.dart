import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FadeAnimation({super.key, required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(
        begin: 0.milliseconds,
        end: 500.milliseconds,
        curve: Curves.easeOut,
      ).tween(AniProps.opacity, 0.0.tweenTo(1.0))
      ..scene(
        begin: 0.milliseconds,
        end: 500.milliseconds,
        curve: Curves.easeOut,
      ).tween(AniProps.translateY, (-30.0).tweenTo(0.0));

    return PlayAnimationBuilder<Movie>(
        delay: Duration(milliseconds: (500 * delay).round()),
        duration: tween.duration,
        tween: tween,
        child: child,
        builder: (context, value, child) {
          final opacity = value.get(AniProps.opacity) ?? 1.0;
          final translateY = value.get(AniProps.translateY) ?? 0.0;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(0, translateY),
              child: child,
            ),
          );
        });
  }
}
