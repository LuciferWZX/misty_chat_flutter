import 'package:flutter/material.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:simple_animations/animation_builder/mirror_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';
import 'package:supercharged/supercharged.dart';
enum _ColorTween { color1, color2 }
class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        _ColorTween.color1,
        ColorsUtil.hexStringColor("#e6f4ff").tweenTo(ColorsUtil.hexStringColor("#f0f5ff")),
        duration: 3.seconds,
      )
      ..tween(
        _ColorTween.color2,
        ColorsUtil.hexStringColor("#b5f5ec").tweenTo(ColorsUtil.hexStringColor("#d9f7be")),
        duration: 3.seconds,
      );

    return MirrorAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    value.get<Color>(_ColorTween.color1),
                    value.get<Color>(_ColorTween.color2)
                  ])),
        );
      },
    );
  }
}