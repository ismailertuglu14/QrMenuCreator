// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/imag_path_extension.dart';

import '../constans/enum/image_keys.dart';

extension ImageAssetExtension on ImageKeys {
  Image imageAsset({BoxFit? fit, double? height, double? width}) {
    return Image.asset('assets/images/ic_$name.png',
        fit: fit, height: height, width: width);
  }
}

extension AssettImageExtension on ImageKeys {
  AssetImage assetImage() {
    return AssetImage(this.path);
  }
}
