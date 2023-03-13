import 'package:instagram_sample_application/views/components/animations/lottie_animation_view.dart';
import 'package:instagram_sample_application/views/components/animations/model/lottie_animation.dart';

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
