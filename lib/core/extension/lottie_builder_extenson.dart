import '../constans/enum/lottie_keys.dart';

extension LottieBuilderExtenison on LottieKeys {
  String items() {
    switch (this) {
      case LottieKeys.SPLASH:
        return "splash";

      case LottieKeys.ERROR:
        return "eror";

      case LottieKeys.LOADING:
        return "loading";

      case LottieKeys.error:
        return "error";
    }
  }

  String get path => "assets/lotties/lottie_${items()}.json";
}
