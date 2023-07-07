import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/image_icon_extenison.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/theme_mode_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/provider/theme_provider.dart';
import '../../../../product/widget/user_circle_avatar.dart';

class BusinessHeader extends StatelessWidget {
  const BusinessHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 0,
            height: context.height * 0.15,
            width: context.width,
            child: Container(color: Color(0xFFe9eaec))),
        Positioned(
          top: context.height * 0.1,
          child: UserCircleAvatar(
            maxRadius: 50,
            backgroundImage: ImageKeys.default_image.assetImage(),
          ),
        ),
      ],
    );
  }
}
