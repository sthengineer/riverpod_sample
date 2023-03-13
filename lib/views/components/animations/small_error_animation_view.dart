import 'package:instagram_sample_application/views/components/animations/lottie_animation_view.dart';
import 'package:instagram_sample_application/views/components/animations/model/lottie_animation.dart';

class SmallErrorAnimationView extends LottieAnimationView {
  const SmallErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.smallError,
        );
}
