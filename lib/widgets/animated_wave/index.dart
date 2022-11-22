import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';
import 'package:supercharged/supercharged.dart';

import 'curve_painter.dart';

class AnimatedWave extends StatelessWidget {
  final double? height;
  final double? speed;
  final double offset;

  const AnimatedWave({super.key, this.height, this.speed, this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: height,
        width: constraints.biggest.width,
        child: LoopAnimationBuilder<double>(
            duration: (5000 / speed!).round().milliseconds,
            tween: 0.0.tweenTo(2 * pi),
            builder: (context, value, child) {
              return CustomPaint(
                foregroundPainter: CurvePainter(value + offset),
              );
            }),
      );
    });
  }
}


