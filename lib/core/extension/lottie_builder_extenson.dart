import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constans/enum/lottie_keys.dart';

extension LottieBuilderExtenison on LottieKeys {
  LottieBuilder path({double? width, double? height, BoxFit? fit}) {
    return Lottie.asset("assets/lotties/lottie_$name.json",
        width: width, height: height, fit: fit);
  }
}
