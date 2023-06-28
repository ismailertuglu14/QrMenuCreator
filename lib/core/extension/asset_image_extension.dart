import 'package:flutter/material.dart';

import '../constans/enum/image_keys.dart';

extension ImageAssetExtension on ImageKeys {
  Image imageAsset({BoxFit? fit, double? height, double? width}) {
    return Image.asset('assets/images/ic_$name.png',
        fit: fit, height: height, width: width);
  }
}

extension AssettImageExtension on ImageKeys {
  AssetImage assetImage() {
    return AssetImage('assets/images/ic_$name.png');
  }
}
