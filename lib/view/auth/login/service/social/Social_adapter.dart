import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';

import '../../../../../core/constans/enum/image_keys.dart';

abstract class ISocialAdapter {
  Future<String?> socialLogin();
  SocialAdapterModel get model;
}

class FacebookAdapter implements ISocialAdapter {
  @override
  Future<String?> socialLogin() async {
    return toString();
  }

  @override
  SocialAdapterModel get model => SocialAdapterModel.facebook();
}

class GoogleAdapter implements ISocialAdapter {
  @override
  Future<String?> socialLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? response = await googleSignIn.signIn();
      if (response != null) {}
    } catch (error) {
      throw Exception(error);
    }
    return null;
  }

  @override
  SocialAdapterModel get model => SocialAdapterModel.google();
}

class AppleAdapter implements ISocialAdapter {
  @override
  Future<String?> socialLogin() async {
    return toString();
  }

  @override
  SocialAdapterModel get model => SocialAdapterModel.apple();
}

class SocialAdapterModel {
  final Color backgroundColor;
  final void Function() onPressed;
  final Image icon;

  SocialAdapterModel(
      {required this.backgroundColor,
      required this.onPressed,
      required this.icon});
  static Image iconPath(ImageKeys icon) {
    return icon.imageAsset(height: 30);
  }

  factory SocialAdapterModel.facebook() => SocialAdapterModel(
      backgroundColor: const Color(0xFF1064dc),
      onPressed: () => FacebookAdapter().socialLogin(),
      icon: iconPath(ImageKeys.facebook));

  factory SocialAdapterModel.google() {
    return SocialAdapterModel(
        backgroundColor: Colors.white,
        onPressed: () => GoogleAdapter().socialLogin(),
        icon: iconPath(ImageKeys.google));
  }
  factory SocialAdapterModel.apple() {
    return SocialAdapterModel(
        backgroundColor: Colors.black,
        onPressed: () => AppleAdapter().socialLogin(),
        icon: iconPath(ImageKeys.apple));
  }
}
