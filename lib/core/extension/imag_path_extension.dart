import '../constans/enum/image_keys.dart';

extension ImagePathExtension on ImageKeys {
  String get path => "assets/images/ic_$name.png";
}
