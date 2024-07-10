import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatelessWidget {
  const FadeAnimationWidget({super.key, required this.duration, required this.child});

  final Duration duration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: duration,
      child: child,
    );
  }
}
