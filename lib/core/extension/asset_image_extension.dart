import 'package:flutter/material.dart';

import '../constans/enum/image_keys.dart';

extension AssetImageExtension on ImageKeys {
  Image assetImage({BoxFit? fit, double? height, double? width}) {
    return Image.asset('assets/images/ic_$name.png',
        fit: fit, height: height, width: width);
  }
}
