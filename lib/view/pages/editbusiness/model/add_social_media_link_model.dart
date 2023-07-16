// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:qrmenu/core/constans/enum/image_keys.dart';

import '../../../../core/constans/enum/add_media_link_keys.dart';

class AddSocialMediaLinkModel {
  String? link;
  ImageKeys imageKey;
  AddMediaLinkKeys type;
  AddSocialMediaLinkModel({
    required this.link,
    required this.imageKey,
    required this.type,
  });
}
