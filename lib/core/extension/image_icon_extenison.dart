import 'package:flutter/material.dart';

import '../constans/enum/image_keys.dart';

extension ImageIconExtension on ImageKeys {
  ImageIcon imageIcon({Color? color = Colors.black}) {
    return ImageIcon(AssetImage("assets/images/ic_$name.png"), color: color);
  }
}
