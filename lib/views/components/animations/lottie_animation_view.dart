import 'package:flutter/cupertino.dart';
import 'package:instagram_sample_application/views/components/animations/model/lottie_animation.dart';
import 'package:lottie/lottie.dart';

extension GetFullPath on LottieAnimation {
  String get fullPath => 'assets/animations/$name.json';
}

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;

  const LottieAnimationView({
    Key? key,
    required this.animation,
    this.repeat = true,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Lottie.asset(animation.fullPath, reverse: reverse, repeat: repeat);
}
